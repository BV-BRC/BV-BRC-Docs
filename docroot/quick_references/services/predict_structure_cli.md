# PredictStructure CLI Reference

The `predict-structure` command-line tool is the workhorse beneath the BV-BRC Protein Structure Prediction Service. It exposes the same five engines (Boltz-2, OpenFold 3, Chai-1, AlphaFold 2, ESMFold) through a single Click-based interface with shared global options and per-tool subcommands.

You can run it three ways:

1. **Directly** on a workstation with the tools installed (or via Docker / Apptainer / Singularity containers).
2. **As CWL workflow** — every subcommand has a matching `cwl/tools/<tool>.cwl` definition.
3. **Through BV-BRC AppService** — the Perl wrapper `service-scripts/App-PredictStructure.pl` builds and executes the same CLI under the hood.

> **Source:** [CEPI-dxkb/PredictStructureApp](https://github.com/CEPI-dxkb/PredictStructureApp) · `predict_structure/cli.py`

## Installation

### Prerequisites

- Python 3.10+ (3.12 recommended)
- conda or miniconda
- One or more of: Docker / Apptainer / Singularity (if you want to use the per-tool containers instead of native installs)
- A GPU (any tool other than ESMFold; ESMFold has a CPU-capable path)

### Quick start

```bash
conda create -n predict-structure python=3.12 -y
conda activate predict-structure

git clone https://github.com/CEPI-dxkb/PredictStructureApp.git
cd PredictStructureApp
pip install -e ".[all]"

predict-structure --version
predict-structure --help
```

### Optional dependency groups

| Group | Adds | Install |
|---|---|---|
| `chai` | PyArrow (A3M → Parquet MSA conversion) | `pip install -e ".[chai]"` |
| `esmfold` | PyTorch, Transformers, Accelerate | `pip install -e ".[esmfold]"` |
| `cwl` | cwltool | `pip install -e ".[cwl]"` |
| `dev` | pytest, black, ruff, mypy | `pip install -e ".[dev]"` |
| `all` | Everything above | `pip install -e ".[all]"` |

The prediction tools themselves (`boltz`, `chai-lab`, `alphafold`, etc.) are installed separately or run inside their Docker images.

## Command structure

```
predict-structure [GLOBAL_FLAGS] <TOOL> [TOOL_FLAGS] --protein <FASTA> -o <DIR>
predict-structure --job jobs.yaml -o <DIR>
```

Where `<TOOL>` is one of `auto`, `boltz`, `openfold`, `chai`, `alphafold`, or `esmfold`. The CLI uses `click.group()`, so `predict-structure <tool> --help` shows the per-tool flag set.

## Entity flags (inputs)

Inputs are specified with explicit entity flags. Every flag is **repeatable** to build multi-entity complexes.

| Flag | Type | Description |
|---|---|---|
| `--protein` | file path | Protein FASTA (a single multi-record FASTA is treated as one multi-chain complex, not separate jobs). Boltz YAML manifests pass through automatically. |
| `--dna` | file path | DNA FASTA |
| `--rna` | file path | RNA FASTA |
| `--ligand` | string | Ligand CCD code (e.g. `ATP`). Glycans use CCD codes too (`NAG`, `MAN`). |
| `--smiles` | string | SMILES string for arbitrary small molecules |

## Global options (every subcommand)

| Flag | Type | Default | Description |
|---|---|---|---|
| `-o`, `--output-dir` | path | **required** | Output directory |
| `-n`, `--num-samples` | int | 1 | Number of structure samples (diffusion samples for Boltz/OpenFold/Chai) |
| `--num-recycles` | int | 3 | Recycling iterations |
| `--seed` | int | (none) | Random seed |
| `--msa` | path | (none) | Pre-computed MSA (`.a3m`, `.sto`, `.pqt`) |
| `--output-format` | enum | `pdb` | `pdb` or `mmcif` |
| `--verbose` | flag | off | Verbose logging |
| `--debug` | flag | off | Print the command instead of executing it |

## Execution options

| Flag | Type | Default | Description |
|---|---|---|---|
| `--backend` | enum | `subprocess` | `subprocess`, `docker`, `apptainer`, or `cwl` |
| `--device` | enum | `gpu` | `gpu` or `cpu` (CPU path is meaningful only for ESMFold) |
| `--image` | string | (per-tool) | Override Docker image (docker / apptainer backends) |
| `--cwl-runner` | string | `cwltool` | CWL runner command (cwl backend only) |
| `--cwl-tool` | path | (auto) | CWL tool definition path (cwl backend only) |

## Tool-specific options

### `boltz` — Boltz-2

```bash
predict-structure boltz --protein input.fasta -o output/ \
  --num-samples 5 --sampling-steps 200 --use-potentials
```

| Flag | Type | Default | Description |
|---|---|---|---|
| `--sampling-steps` | int | 200 | Diffusion sampling steps |
| `--use-msa-server` | flag | off | Use the ColabFold MSA server (MMseqs2 against UniRef + ColabFoldDB) instead of requiring a pre-computed MSA file |
| `--msa-server-url` | string | (none) | Custom MSA server URL (implies `--use-msa-server`) |
| `--use-potentials` | flag | off | Enable potential terms (steered diffusion) |

### `openfold` — OpenFold 3

| Flag | Type | Default | Description |
|---|---|---|---|
| `--num-diffusion-samples` | int | 5 | Diffusion samples per query |
| `--num-model-seeds` | int | 1 | Independent model seeds |
| `--use-msa-server / --no-msa-server` | flag | on | ColabFold MSA server |
| `--use-templates / --no-templates` | flag | on | Use template structures |
| `--checkpoint` | string | (latest) | Model checkpoint name |

### `chai` — Chai-1

```bash
predict-structure chai --protein input.fasta -o output/ \
  --num-samples 5 --use-msa-server --no-esm-embeddings
```

| Flag | Type | Default | Description |
|---|---|---|---|
| `--sampling-steps` | int | 200 | Diffusion timesteps |
| `--use-msa-server` | flag | off | Use remote MSA server |
| `--msa-server-url` | string | (none) | Custom MSA server URL |
| `--no-esm-embeddings` | flag | off | Disable ESM2 language-model embeddings |
| `--use-templates-server` | flag | off | Use PDB template server |
| `--constraint-path` | path | (none) | Constraint JSON file |
| `--template-hits-path` | path | (none) | Pre-computed template hits |
| `--num-trunk-samples` | int | 1 | Independent trunk forward passes |
| `--recycle-msa-subsample` | int | 0 | MSA subsample per recycle (0 = all) |
| `--no-low-memory` | flag | off | Disable low-memory mode |

### `alphafold` — AlphaFold 2

```bash
predict-structure alphafold --protein input.fasta -o output/ \
  --af2-data-dir /databases --af2-model-preset monomer
```

| Flag | Type | Default | Description |
|---|---|---|---|
| `--af2-data-dir` | path | **required** | AlphaFold database directory (~2 TB) |
| `--af2-model-preset` | string | `monomer` | `monomer`, `monomer_casp14`, or `multimer` |
| `--af2-db-preset` | string | `reduced_dbs` | `reduced_dbs` or `full_dbs` |
| `--af2-max-template-date` | YYYY-MM-DD | `2022-01-01` | Maximum template date |

### `esmfold` — ESMFold

```bash
predict-structure esmfold --protein input.fasta -o output/ --fp16 --device cpu
```

| Flag | Type | Default | Description |
|---|---|---|---|
| `--fp16` | flag | off | Half-precision inference (faster, lower memory) |
| `--chunk-size` | int | (none) | Chunk size for long sequences |
| `--max-tokens-per-batch` | int | (none) | Max tokens per batch |

## Auto subcommand

`predict-structure auto --protein input.fasta -o output/` runs the auto-selector. The selection algorithm:

```
if device == cpu and only protein:
    → ESMFold
for tool in [boltz, openfold, chai, esmfold, alphafold]:
    if tool in {alphafold, esmfold} and any non-protein entity:
        skip
    if tool in {boltz, openfold, chai} and protein and no MSA:
        skip   # diffusion tools need real MSA; dummy single-sequence MSA produces unusable output
    if tool == alphafold and AF database dir missing:
        skip
    if tool not installed:
        skip
    return tool
raise: no prediction tool found
```

## Batch jobs (`--job`)

The `--job` flag runs multiple independent predictions from a YAML manifest. It is **mutually exclusive** with the subcommands — you cannot combine `--job` with `boltz`, `chai`, etc.

```bash
predict-structure --job jobs.yaml -o output/
```

Each job lands in `output/job_000/`, `output/job_001/`, … Job manifest schema:

```yaml
- protein: [/path/to/protein1.fasta]
  options:
    num_samples: 5
    device: gpu

- protein: [/path/to/protein2.fasta]
  ligands: [ATP]
  tool: boltz
  options:
    num_samples: 3
    use_potentials: true

- protein: [/path/to/protein3.fasta]
  dna: [/path/to/dna.fasta]
  tool: chai
  options:
    sampling_steps: 100
```

| Key | Type | Description |
|---|---|---|
| `protein` | list of paths | Protein FASTA files |
| `dna` | list of paths | DNA FASTA files |
| `rna` | list of paths | RNA FASTA files |
| `ligands` | list of strings | Ligand CCD codes |
| `smiles` | list of strings | SMILES strings |
| `tool` | string | Tool name (optional — auto-selects if omitted) |
| `options` | dict | Any shared or tool-specific option |

## Parameter mapping (shared → native)

The unified flags are mapped to each tool's native option name internally:

| Shared flag | Boltz-2 | OpenFold 3 | Chai-1 | AlphaFold 2 | ESMFold |
|---|---|---|---|---|---|
| `--output-dir` | `--out_dir` | `--output_dir` | positional | `--output_dir` | `-o` |
| `--num-samples` | `--diffusion_samples` | `--num_diffusion_samples` | `--num-diffn-samples` | (N/A) | (N/A) |
| `--num-recycles` | `--recycling_steps` | `--num_recycles` | `--num-trunk-recycles` | implicit | `--num-recycles` |
| `--seed` | (N/A) | `--seed` | `--seed` | `--random_seed` | (N/A) |
| `--device` | `--accelerator` | `--device` | `--device` | implicit | `--cpu-only` |
| `--msa` | injected into Boltz YAML `msa:` | JSON `main_msa_file_paths` | A3M → Parquet converted | (uses local DBs) | ignored |

## Examples

```bash
# Protein structure prediction with Boltz-2
predict-structure boltz --protein input.fasta -o output/

# Protein with ESMFold (CPU-capable, FP16)
predict-structure esmfold --protein input.fasta -o output/ --fp16

# Chai-1 with pre-computed MSA
predict-structure chai --protein input.fasta -o output/ --msa alignment.a3m

# AlphaFold 2 with local databases
predict-structure alphafold --protein input.fasta -o output/ \
  --af2-data-dir /databases

# Auto: pick the best available tool
predict-structure auto --protein input.fasta -o output/

# Multi-entity protein–DNA complex
predict-structure boltz --protein protein.fasta --dna dna.fasta -o output/

# Protein–ligand with CCD code
predict-structure boltz --protein protein.fasta --ligand ATP -o output/

# Protein with SMILES ligand
predict-structure boltz --protein protein.fasta --smiles "CCO" -o output/

# Multi-chain protein with Chai
predict-structure chai --protein chainA.fasta --protein chainB.fasta \
  --ligand ATP -o output/

# Dry-run — print the underlying command without executing
predict-structure boltz --protein input.fasta -o output/ --debug
```

## Exit codes

| Code | Meaning |
|---|---|
| 0 | Success |
| 1 | Generic failure (see logs) |
| 2 | Usage / argument error (Click) |
| 3 | Input validation error (missing required entity, conflicting flags) |
| 4 | Tool / dependency not found |
| 5 | Runtime error inside the underlying engine |
| 124 | Time-out (killed by external scheduler) |

## Logging and debugging

- `--verbose` enables `INFO`-level logging from the CLI and adapters.
- `--debug` is a **dry-run**: prints the full underlying command line and exits 0. Use it to verify parameter mapping before submitting a long job.
- Setting `P3_DEBUG=1` and `P3_LOG_LEVEL=DEBUG` in the environment turns on the Perl AppService trace path (mirrors the **Debug Mode** checkbox in the BV-BRC form).
- Every run writes `metadata/runtime.json` with the resolved command, environment, peak memory, and wall time — the first thing to look at when a job behaves strangely.

## CWL workflows

The CLI is mirrored by a set of CWL tool definitions for use in pipeline runners:

```
cwl/tools/
  predict-structure-app.cwl   # Entry point
  predict-structure.cwl       # Unified CLI wrapper
  boltz.cwl
  chai.cwl
  openfold.cwl
  alphafold.cwl
  esmfold.cwl
  ...
cwl/workflows/
  protein-structure-prediction.cwl
  multi-tool-comparison.cwl   # Run all engines side-by-side
  boltz-report.cwl
  alphafold-report.cwl
  ...
```

Run a workflow with cwltool or GoWe:

```bash
cwltool cwl/workflows/protein-structure-prediction.cwl cwl/jobs/test-predict-alphafold.yml
```

See `docs/CWL_WORKFLOWS.md` in the source repository for the full CWL reference.

## See also

- [Quick Reference](/quick_references/services/predict_structure_service)
- [API Reference](/quick_references/services/predict_structure_api)
- [Folding Tools Comparison](https://github.com/wilke/ProteinStructurePrediction/blob/main/docs/folding_tools_comparison.md)
- [Protein Folding Primer](https://github.com/wilke/ProteinStructurePrediction/blob/main/docs/protein_folding_primer.md)
- Source: [CEPI-dxkb/PredictStructureApp](https://github.com/CEPI-dxkb/PredictStructureApp)
