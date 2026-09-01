# StabiliNNator API Reference

This document describes the network API used to submit and monitor Protein Stability Prediction (StabiliNNator) jobs. The envelope is shared with every other BV-BRC service — only the `values` payload is service-specific.

> **Scope.** This is the *AppService* JSON-RPC interface — the one the web form talks to when you click **Submit Job**. The public REST data API at `https://www.bv-brc.org/api/` (documented at <https://www.bv-brc.org/api/doc/>) is a different endpoint and is not covered here.

## Transport

JSON-RPC 2.0 over HTTPS POST, with the BV-BRC-specific MIME type `application/jsonrpc+json` (not plain `application/json`).

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
  "params": ["StabiliNNator", { ...values... }, { ...start_params... }]
}
```

Response on success:

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": [ { "id": "<task-id>", "app": { "id": "StabiliNNator" }, ... } ]
}
```

The current production AppService endpoint is `https://www.bv-brc.org/services/AppService`.

## Authentication

Every call requires a BV-BRC auth token in the `Authorization` header. The UI obtains one through the login flow; for programmatic use see the `p3-login` / `p3-token` tools shipped with the BV-BRC CLI.

## Parameters

The `values` object mirrors the app spec in [`app_specs/StabiliNNator.json`](https://github.com/CEPI-dxkb/stabiliNNatorApp/blob/main/app_specs/StabiliNNator.json).

| Field | Type | Required | Default | Description |
|---|---|---|---|---|
| `input_file` | wsfile (`ws://...`) | yes | — | Protein structure in PDB or mmCIF format. Must contain standard amino acids with CA atoms |
| `analysis_type` | enum | yes | `both` | `proline` \| `disulfide` \| `both` |
| `output_path` | folder (`ws://...`) | yes | — | Workspace folder where the job result directory will be created |
| `output_file` | string | yes | — | Job result name; results land at `${output_path}/.${output_file}/` |
| `theme` | enum | no | `bvbrc` | Report styling: `bvbrc` \| `editorial`. Presentation only |
| `accelerator` | enum | no | `cpu` | `cpu` \| `gpu`. CPU is recommended and normally faster — see *Choosing a device* below |
| `hidden_dim` | int | no | `32` | Network hidden dimension. Both shipped models were trained with 32; change only for custom-trained models |
| `dry_run` | boolean | no | `false` | Validate inputs and workspace access, then stop without predicting |

Workspace files use the `ws://<user>@BVBRC/<path>` URI scheme.

### Validation rules enforced by the service

`App-StabiliNNator.pl` rejects the submission before running any prediction if:

1. `output_path` is absent.
2. `output_file` is absent. Both are checked explicitly in the service script — results are written to `${output_path}/.${output_file}/`, so a missing name has nowhere valid to land.
3. `input_file` is absent.
4. The input parses as neither PDB (an `ATOM`/`HETATM` record) nor mmCIF (a `data_`/`loop_` block with `_atom_site.` records).

An mmCIF input is converted to PDB before the models run — both read PDB only — and the job also stops if that conversion cannot be done faithfully: multi-character chain identifiers and structures over 99,999 atoms exceed what PDB format can represent, and are reported rather than truncated. Multi-model entries are reduced to the first model, for mmCIF and PDB alike.

`analysis_type` is validated against its enum by the framework before the service script runs.

### Choosing a device

`accelerator` defaults to `cpu`, and that is the recommended setting. The two models are 14–22 KB; CUDA initialization costs several seconds, which exceeds the compute it saves. Setting `gpu` requests a GPU and, if CUDA is unavailable at runtime, the job fails rather than silently falling back.

The partition a job is scheduled on is a placement constraint about where the shared container image is staged, not a statement about how inference runs; it is set by preflight and is not client-controllable.

## Start parameters

The `start_params` (3rd argument) is a bag of UI hints attached by the Web form: `parent_id`, `workflow_id`, `comment`. Pass `{}` if you have nothing to set.

## Preflight

The AppService calls preflight internally before scheduling; clients do not call it directly. StabiliNNator reports a fixed estimate, independent of input size:

```json
{
  "cpu": 2,
  "memory": "1G",
  "runtime": 600,
  "storage": "1G",
  "policy_data": { "gpu_count": 0, "partition": "compute" }
}
```

The 10-minute allowance is dominated by container staging rather than inference, which is sub-second. `gpu_count` is 0 because inference runs on CPU.

## Results

On success the workspace contains a job directory at `${output_path}/.${output_file}/`, and the task's `output_files` lists its contents:

```
${output_path}/.${output_file}/
├── stabilinnator_report.html        # fixed name — the user-facing entry point
├── <input>_proline.pdb              # probability in the B-factor column
├── <input>_disulfide.pdb
├── <input>_proline_summary.tsv      # ranked, highest probability first
├── <input>_disulfide_summary.tsv
└── <input>_summary.json             # top 25 sites per analysis
```

`<input>` is the basename of the input structure. Files for an analysis that was not requested are absent. The report filename is fixed, so a client can locate it without knowing the input name.

`<input>_summary.json` is the machine-readable entry point:

```json
{
  "input": "crambin.pdb",
  "analysis_type": "both",
  "proline": {
    "top_sites": [
      { "rank": 1, "chain": "A", "pos": 21, "icode": "",
        "residue": "THR", "probability": 0.97 }
    ]
  },
  "disulfide": {
    "cys_sites": [
      { "rank": 1, "chain": "A", "pos": 3, "icode": "",
        "residue": "CYS", "probability": 1 }
    ]
  }
}
```

Sites carry `"note": "already PRO"` where a high-scoring proline position is already a proline and therefore not an actionable substitution.

## Example request — both analyses

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "AppService.start_app2",
  "params": [
    "StabiliNNator",
    {
      "input_file": "ws://awilke@BVBRC/home/structures/crambin.pdb",
      "analysis_type": "both",
      "output_path": "ws://awilke@BVBRC/home/jobs/",
      "output_file": "crambin-stability-2026-08-25"
    },
    {}
  ]
}
```

## Example request — disulfide only, from a predicted structure

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "AppService.start_app2",
  "params": [
    "StabiliNNator",
    {
      "input_file": "ws://awilke@BVBRC/home/jobs/.spike-boltz/predictions/rank_1.pdb",
      "analysis_type": "disulfide",
      "output_path": "ws://awilke@BVBRC/home/jobs/",
      "output_file": "spike-disulfide"
    },
    { "comment": "prefusion stabilization candidates" }
  ]
}
```

Chaining the two services this way — predict a structure, then score it for stabilizing mutations — is the common workflow.

## Citation

- Olson RD et al. **Introducing the Bacterial and Viral Bioinformatics Resource Center (BV-BRC): a resource combining PATRIC, IRD and ViPR.** *Nucleic Acids Research* 51(D1), D678–D689 (2023). [doi:10.1093/nar/gkac1003](https://doi.org/10.1093/nar/gkac1003)

## See also

- [Quick Reference](/quick_references/services/stabilinnator_service)
- [PredictStructure API Reference](/quick_references/services/predict_structure_api)
