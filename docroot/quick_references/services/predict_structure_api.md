# PredictStructure API Reference

This document describes the network API that the BV-BRC web UI uses to submit and monitor PredictStructure jobs. Other BV-BRC services use the same envelope, so most of this generalizes — only the parameter object on the wire (the `values` payload) is service-specific.

> **Scope.** This is the *AppService* JSON-RPC interface — the one the web form talks to when you click **Submit Job**. The public REST data API at `https://www.bv-brc.org/api/` (documented at <https://www.bv-brc.org/api/doc/>) is a different endpoint and is not covered here.

## Endpoints

The Web UI initializes three RPC endpoints (`public/js/p3/app/p3app.js`); for job submission only the first one matters.

| Endpoint | Purpose | Configured in |
|---|---|---|
| `serviceAPI` | **AppService** — submit / query jobs (this doc) | `BV-BRC-Web` config |
| `workspaceAPI` | Workspace file CRUD (the `ws://` URIs you'll see in payloads) | `BV-BRC-Web` config |
| `dataAPI` | Public RDF / Solr data API | `BV-BRC-Web` config |

The current production AppService endpoint is `https://www.bv-brc.org/services/AppService` (subject to change; the value used by the live UI is whatever `serviceAPI` was set to in the deployed `config.js`).

## Transport

JSON-RPC 2.0 over HTTPS POST with one custom detail: the content type is the BV-BRC-specific MIME type `application/jsonrpc+json` (not plain `application/json`).

```
POST <serviceAPI>
Content-Type: application/jsonrpc+json
Authorization: <BV-BRC auth token>
X-Requested-With: false
```

Request body:

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "AppService.start_app2",
  "params": ["PredictStructure", { ...values... }, { ...start_params... }]
}
```

Response on success:

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": [ { "id": "<task-id>", "app": { "id": "PredictStructure" }, ... } ]
}
```

Response on failure:

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "error": { "code": -32000, "message": "...", "data": "..." }
}
```

## Authentication

Every call requires a BV-BRC auth token in the `Authorization` header. Tokens are issued by the BV-BRC account service; the UI obtains one through the login flow and stores it in `window.App.authorizationToken`. For programmatic use, see the BV-BRC SDK or the `p3-login` / `p3-token` tools shipped with the BV-BRC CLI.

## Methods

### `AppService.start_app2`

Submit a new PredictStructure job.

```
AppService.start_app2(app_id, values, start_params) → [task]
```

| Argument | Type | Description |
|---|---|---|
| `app_id` | string | Always `"PredictStructure"` |
| `values` | object | Job parameters (see [Parameters](#parameters)) |
| `start_params` | object | Submission metadata (see [Start parameters](#start-parameters)) |

Returns a single-element array containing the task descriptor:

```json
[
  {
    "id": "a3f8c9d2-...",
    "parent_id": null,
    "app": { "id": "PredictStructure", "label": "Protein Structure Prediction" },
    "workspace": "/<user>/.<output_name>",
    "parameters": { ...echoed values... },
    "user_id": "<user>@BVBRC",
    "submit_time": "2026-05-21T19:30:00Z",
    "start_time": null,
    "completed_time": null,
    "status": "queued"
  }
]
```

### `AppService.query_tasks` / `AppService.query_task_summary`

Inspect job status. The Web UI calls `query_task_summary` on each page load for the **Completed Jobs** badge; the Jobs list view paginates via `query_tasks`.

```
AppService.query_task_summary([]) → [{ submitted, queued, in_progress, completed, failed, ... }]
AppService.query_tasks([ids?]) → [tasks...]
```

### `AppService.enumerate_apps`

Lists all registered app specs the AppService knows about. Useful to confirm the deployed `PredictStructure.json` parameter set matches what your client expects.

### `AppService.kill_task` / `AppService.delete_task`

Standard administrative endpoints; require ownership of the task.

## Parameters

The `values` object mirrors the basic app spec in [`app_specs/PredictStructure.json`](https://github.com/CEPI-dxkb/PredictStructureApp/blob/main/app_specs/PredictStructure.json). Only `tool`, `output_path`, and `output_file` are required by the schema; the rest depend on what you're predicting.

| Field | Type | Required | Description |
|---|---|---|---|
| `tool` | enum | yes | `auto` \| `boltz` \| `openfold` \| `chai` \| `alphafold` \| `esmfold` |
| `input_file` | wsfile (`ws://...`) | conditional | Protein FASTA. Required unless DNA / RNA / ligand / SMILES / `text_input` is given |
| `dna_file` | wsfile | no | DNA FASTA (Boltz / OpenFold / Chai only) |
| `rna_file` | wsfile | no | RNA FASTA (Boltz / OpenFold / Chai only) |
| `ligand` | array of string | no | CCD codes, each 1–3 alphanumeric chars (e.g. `["ATP", "NAG"]`) |
| `smiles` | array of string | no | SMILES strings |
| `text_input` | array of object | no | Inline sequences: `{ "sequence": "...", "type": "auto|protein|dna|rna" }`. Lets clients submit without a workspace file |
| `msa_file` | wsfile | conditional | Pre-computed MSA (`.a3m`, `.sto`, `.pqt`). Required for Boltz / OpenFold / Chai unless `use_msa_server` is set; in that case BV-BRC computes the MSA with ColabFold |
| `debug` | boolean | no | Verbose service-side logging (sets `P3_DEBUG=1`) |
| `output_path` | folder (`ws://...`) | yes | Workspace folder where the job result directory will be created |
| `output_file` | string | yes | Job result name; results land at `${output_path}/.${output_file}/` |

Workspace files use the `ws://<user>@BVBRC/<path>` URI scheme. The service script resolves them via `p3-cp` before launching the underlying engine.

### Validation rules enforced by the service

The Perl `App-PredictStructure.pl` rejects the submission *before* it reaches the queue if any of the following are violated:

1. At least one of `input_file`, `dna_file`, `rna_file`, `text_input`, `ligand`, or `smiles` is present.
2. Both `output_path` and `output_file` are present.
3. CCD ligand codes match `/^[A-Za-z0-9]{1,3}$/`.
4. SMILES strings are non-empty.
5. `text_input[i].type ∈ { auto, protein, dna, rna }`.
6. FASTA inputs start with `>` on the first non-blank line (peek of first 5 lines via `p3-cat | head`).
7. MSA inputs start with `>` (A3M) or `# STOCKHOLM` (Stockholm) on the first non-blank line.
8. Boltz YAML manifests (passed as `input_file` with `.yaml`/`.yml`) contain both `version:` and `sequences:` keys.

A validation failure returns a JSON-RPC error with the human-readable reason in `error.message`.

### Tool-specific parameter compatibility

Even though the schema accepts any combination, the Perl preflight will reject combinations that no engine can run:

| Tool | DNA | RNA | Ligand | SMILES | MSA required |
|---|:-:|:-:|:-:|:-:|:-:|
| `boltz` | ✓ | ✓ | ✓ | ✓ | ✓ |
| `openfold` | ✓ | ✓ | ✓ | ✓ | ✓ |
| `chai` | ✓ | ✓ | ✓ | — | ✓ |
| `alphafold` | — | — | — | — | (built locally) |
| `esmfold` | — | — | — | — | — |
| `auto` | (forwarded; selector decides) | | | | conditional |

Submitting `{ "tool": "alphafold", "dna_file": "ws://..." }` returns:

```
error: AlphaFold 2 supports protein only; remove dna_file or change tool to boltz/openfold/chai.
```

## Start parameters

The `start_params` (3rd argument) is a small bag of UI/UX hints attached by the Web form. The schema is not formally specified; the keys you'll see in practice are:

| Field | Type | Description |
|---|---|---|
| `parent_id` | string | Parent task ID when this submission is a "rerun" |
| `workflow_id` | string | Identifier when launched as part of a multi-app workflow |
| `comment` | string | Free-text job label shown in the Jobs list |

Pass `{}` if you don't have anything to set.

## Job lifecycle

```
[client]                              [AppService]                   [worker]
  │ start_app2 PredictStructure ───▶ │                                │
  │                                   │── persist task, status=queued│
  │ ◀──── task descriptor ───────────│                                │
  │                                   │                                │
  │ query_task_summary  ◀── poll ───│                                │
  │                                   │   pick from queue ───────────▶│
  │                                   │                       run     │
  │                                   │     status=in_progress ◀──────│
  │                                   │                                │
  │                                   │           preflight (resource estimate)
  │                                   │           validate inputs
  │                                   │           p3-cp ws:// → /tmp
  │                                   │           predict-structure <tool> ...
  │                                   │           protein_compare (report)
  │                                   │           p3-cp results → ws://output_path
  │                                   │                                │
  │                                   │     status=completed   ◀──────│
  │ query_tasks([id])  ────▶          │                                │
  │ ◀──── final task w/ paths ────────│                                │
```

Failures are surfaced as `status: failed` with `stderr` accessible via the workspace job directory.

## Preflight

The Web UI does **not** call preflight directly — the AppService calls it internally before scheduling. Programmatic clients can invoke it via the same JSON-RPC method that the AppService uses, but the practical equivalent is the Python CLI:

```bash
predict-structure preflight --tool boltz --msa /dev/null
# → { "cpu": 8, "memory_gb": 64, "runtime_hours": 4, "gpu": true, "partition": "gpu2" }
```

The preflight result is what determines which node the job runs on. The defaults from `PredictStructure.json` are:

```json
{
  "default_memory": "64G",
  "default_cpu": 8,
  "default_runtime": 14400
}
```

## Example request — Boltz with MSA, single chain

```json
{
  "jsonrpc": "2.0",
  "id": 42,
  "method": "AppService.start_app2",
  "params": [
    "PredictStructure",
    {
      "tool": "boltz",
      "input_file": "ws://awilke@BVBRC/home/inputs/crambin.fasta",
      "msa_file":   "ws://awilke@BVBRC/home/inputs/crambin.a3m",
      "output_path": "ws://awilke@BVBRC/home/jobs/",
      "output_file": "crambin-boltz-2026-05-21"
    },
    {}
  ]
}
```

## Example request — protein–DNA complex (auto-select)

```json
{
  "jsonrpc": "2.0",
  "id": 43,
  "method": "AppService.start_app2",
  "params": [
    "PredictStructure",
    {
      "tool": "auto",
      "input_file": "ws://awilke@BVBRC/home/tf.fasta",
      "dna_file":   "ws://awilke@BVBRC/home/operator.fasta",
      "msa_file":   "ws://awilke@BVBRC/home/tf.a3m",
      "ligand":     ["MG"],
      "output_path": "ws://awilke@BVBRC/home/jobs/",
      "output_file": "tf-dna-complex"
    },
    { "comment": "DNA-binding TF + Mg2+" }
  ]
}
```

## Example request — protein–ligand with SMILES (Boltz only)

```json
{
  "jsonrpc": "2.0",
  "id": 44,
  "method": "AppService.start_app2",
  "params": [
    "PredictStructure",
    {
      "tool": "boltz",
      "input_file": "ws://awilke@BVBRC/home/kinase.fasta",
      "msa_file":   "ws://awilke@BVBRC/home/kinase.a3m",
      "smiles":     ["CC(=O)Oc1ccccc1C(=O)O"],
      "output_path": "ws://awilke@BVBRC/home/jobs/",
      "output_file": "kinase-aspirin"
    },
    {}
  ]
}
```

## Example request — inline sequences with `text_input`

```json
{
  "jsonrpc": "2.0",
  "id": 45,
  "method": "AppService.start_app2",
  "params": [
    "PredictStructure",
    {
      "tool": "esmfold",
      "text_input": [
        { "sequence": "MEEPQSDPSVEPPLSQETFSDLWKLLPENN...", "type": "protein" }
      ],
      "output_path": "ws://awilke@BVBRC/home/jobs/",
      "output_file": "p53-esmfold"
    },
    {}
  ]
}
```

## Output

On success, the workspace folder contains a job directory `${output_path}/.${output_file}/` with the canonical layout documented in the [Quick Reference](/quick_references/services/predict_structure_service#output-results). The task descriptor returned by `query_tasks` includes the absolute workspace path; the UI uses this to render the result page.

## Errors

The server returns standard JSON-RPC 2.0 error objects:

| `error.code` | Meaning |
|---|---|
| `-32600` | Invalid request envelope |
| `-32601` | Method not found (typo in `method`) |
| `-32602` | Invalid params (schema mismatch, e.g. ligand longer than 3 chars) |
| `-32603` | Internal error |
| `-32000` | Application error from `App-PredictStructure.pl` (validation, preflight, runtime); message contains the reason |
| `-32001` | Not authorized (token invalid / expired) |

## Rate limiting and quotas

AppService enforces per-user concurrency limits on running jobs and aggregate runtime quotas, configured per BV-BRC deployment. The current production caps are not exposed via the API; queued jobs in excess of the cap remain in `status: queued` until earlier ones finish.

## Client examples

### `curl`

```bash
TOKEN="$(p3-token)"   # or read from ~/.patric_token
curl -sS https://www.bv-brc.org/services/AppService \
  -H "Content-Type: application/jsonrpc+json" \
  -H "Authorization: $TOKEN" \
  -d '{
    "jsonrpc": "2.0", "id": 1,
    "method": "AppService.start_app2",
    "params": ["PredictStructure", {
      "tool": "esmfold",
      "input_file": "ws://awilke@BVBRC/home/crambin.fasta",
      "output_path": "ws://awilke@BVBRC/home/jobs/",
      "output_file": "crambin-esm"
    }, {}]
  }'
```

### Python (`requests`)

```python
import os, requests
TOKEN = open(os.path.expanduser("~/.patric_token")).read().strip()
body = {
    "jsonrpc": "2.0", "id": 1,
    "method": "AppService.start_app2",
    "params": ["PredictStructure", {
        "tool": "boltz",
        "input_file": "ws://awilke@BVBRC/home/crambin.fasta",
        "msa_file":   "ws://awilke@BVBRC/home/crambin.a3m",
        "output_path":"ws://awilke@BVBRC/home/jobs/",
        "output_file":"crambin-boltz",
    }, {}],
}
r = requests.post(
    "https://www.bv-brc.org/services/AppService",
    headers={
        "Content-Type": "application/jsonrpc+json",
        "Authorization": TOKEN,
    },
    json=body,
    timeout=120,
)
r.raise_for_status()
print(r.json())
```

### Python (BV-BRC SDK)

```python
from Bio.KBase.AppService import Client          # if installed
c = Client("https://www.bv-brc.org/services/AppService", token=TOKEN)
task = c.start_app2("PredictStructure", {
    "tool": "auto",
    "input_file": "ws://awilke@BVBRC/home/crambin.fasta",
    "msa_file":   "ws://awilke@BVBRC/home/crambin.a3m",
    "output_path":"ws://awilke@BVBRC/home/jobs/",
    "output_file":"crambin-auto",
}, {})
```

## See also

- BV-BRC Data API (public REST, *not* this endpoint): <https://www.bv-brc.org/api/doc/>
- [Quick Reference](/quick_references/services/predict_structure_service)
- [CLI Reference](/quick_references/services/predict_structure_cli)
- Source: [CEPI-dxkb/PredictStructureApp](https://github.com/CEPI-dxkb/PredictStructureApp) (`service-scripts/App-PredictStructure.pl`, `app_specs/PredictStructure.json`)
- UI widget: [BV-BRC/BV-BRC-Web](https://github.com/BV-BRC/BV-BRC-Web/blob/master/public/js/p3/widget/app/PredictStructure.js)
