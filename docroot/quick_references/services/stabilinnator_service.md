# Protein Stability Prediction Service (stabiliNNator)

## Overview

The Protein Stability Prediction Service identifies positions in an existing protein structure where a targeted mutation is likely to increase thermal stability. It takes a 3D structure — not a sequence — and scores every residue with a graph neural network.

Two complementary analyses are available, and they can be run together in one job:

| Analysis | Question it answers | Scored residues |
|---|---|---|
| **proliNNator** | Which positions would tolerate, or benefit from, substitution to proline? | All residues except cysteines |
| **disulfiNNate** | Which cysteine positions are likely to form a stabilizing disulfide bond? | Cysteines (CYS / CYX) |

Both models are Graph Attention Networks that treat the structure as a graph of residues and their spatial neighbors. Each returns a probability between 0 and 1 per residue, written into the **B-factor column** of an annotated PDB so that any structure viewer can color by it directly.

Proline substitution and disulfide engineering are two of the most widely used strategies for rigidifying a protein — for example, stabilizing a viral glycoprotein in its prefusion conformation for vaccine design. This service ranks candidate positions so that wet-lab effort can be spent on the most promising handful.

## See also

- [Protein Stability Prediction API Reference](/quick_references/services/stabilinnator_api)
- [Protein Structure Prediction Service](/quick_references/services/predict_structure_service) — generates the structures this service scores

## Using the Protein Stability Prediction Service

The **Protein Stability Prediction** submenu option under the **Services** main menu (Protein Tools category) opens the input form. *Note: You must be logged into BV-BRC to use this service.*

If you do not already have a structure, run the [Protein Structure Prediction Service](/quick_references/services/predict_structure_service) first and use its top-ranked PDB as the input here.

## Options

The form has three sections — **Input Structure**, **Analysis**, and **Output** — described below in the order they appear.

## Input Structure

A protein structure in **PDB** or **mmCIF** format, selected from your workspace. The structure must contain standard amino acids with CA atoms — the graph is built from residue positions, so a backbone trace at minimum is required.

Three input characteristics are handled automatically:

- **NMR / multi-model ensembles.** Only the first model is scored. Without this, a 38-model ensemble of a 20-residue peptide would be read as 760 concatenated residues and the scores would be meaningless.
- **Multiple chains.** All chains present are scored; results identify each residue by chain, position, and insertion code.
- **mmCIF.** Converted to PDB before scoring, because the two prediction models read PDB only. The conversion is lossless for what the models use — coordinates, residue and chain identity — and predictions are identical either way.

Two structures cannot be converted, and the job stops with a message saying so rather than scoring a truncated molecule. Both are cases PDB format itself cannot represent:

| Case | Why | What to do |
|---|---|---|
| Multi-character chain identifiers | PDB allows one character per chain | Split the structure by chain, or convert it yourself with the chain mapping you want |
| More than 99,999 atoms | PDB atom serial numbers stop there | Submit the chains or domain you actually want scored |

These are the large-assembly cases, and they are the reason to score a subunit rather than a whole complex.

## Analysis

Which analysis to run.

| Value | Runs | Produces |
|---|---|---|
| `both` *(default)* | proliNNator and disulfiNNate | Both annotated PDBs and both ranked summaries |
| `proline` | proliNNator only | Proline outputs only |
| `disulfide` | disulfiNNate only | Disulfide outputs only |

`both` is the common case; the two analyses are independent and together take only a few seconds longer than either alone.

## Output

Every submission creates a **job** with the name you give it. A workspace object named after the job is created inside the Output Folder and holds all job-related information — parameters, status, logs, and the results themselves.

```
<Output Folder>/<Job Name>
```

### Report Theme

Visual styling for the generated HTML report.

| Value | Description |
|---|---|
| `bvbrc` *(default)* | Matches BV-BRC portal styling |
| `editorial` | Alternative editorial layout |

This affects presentation only — the underlying results are identical.

### Output Folder

The workspace folder where the job will be created. Must already exist, or create one from the folder selector.

### Job Name

Identifier for this run, used as the workspace object name. Results are written to `<Output Folder>/.<Job Name>/`. Give each run its own name; two jobs sharing a name write into the same folder.

## Parameters not on the form

Three parameters are accepted by the service but deliberately not exposed in the
submission form. They are available through the
[API](/quick_references/services/stabilinnator_api).

| Parameter | Default | Description |
|---|---|---|
| `accelerator` | `cpu` | `cpu` or `gpu`. CPU is recommended and is normally *faster*: the models are small (14–22 KB), so CUDA initialization overhead exceeds any compute savings. |
| `hidden_dim` | `32` | Network hidden dimension. Both shipped models were trained with 32; change only when supplying custom-trained models. |
| `dry_run` | `false` | Validates workspace access and input parsing, then stops without running predictions. |

## Output Results

A completed job contains the following files. `<input>` is the basename of the input structure, so scoring `crambin.pdb` yields `crambin_proline.pdb` and so on.

```
<job_name>/
├── stabilinnator_report.html        # Interactive HTML report — start here
├── <input>_proline.pdb              # Structure, proline probability in B-factor
├── <input>_disulfide.pdb            # Structure, disulfide probability in B-factor
├── <input>_proline_summary.tsv      # Full ranking, highest probability first
├── <input>_disulfide_summary.tsv    # Cysteines only, ranked
└── <input>_summary.json             # Combined machine-readable summary
```

Files for an analysis you did not request are simply absent.

### The HTML report

`stabilinnator_report.html` is self-contained — no network access is needed to view it, and it can be downloaded and shared as a single file. Select it in the workspace and use the **REPORT** action (the eye icon) or **View**. It contains:

- the input structure and the models used, with the exact commands run
- an interactive 3D viewer of the structure, colored by predicted probability
- ranked tables of candidate positions
- a per-residue stability track along the sequence
- geometrically detected existing disulfide bonds
- links to the sibling data files

### Interpreting the scores

The scores are delivered in two places: as a ranked table in the `_summary.tsv` files, and as a number per residue in the **B-factor column** of the annotated structures `<input>_proline.pdb` and `<input>_disulfide.pdb`. The B-factor column is columns 61-66 of a PDB `ATOM` record — normally a crystallographic temperature factor, reused here to carry the prediction so that any structure viewer can color by it with no extra tooling. The input structure's own B-factors are overwritten in these two files; the input itself is untouched.

The value is a probability from 0 to 1. **Higher means a more favorable predicted site.** These are rankings, not free-energy predictions: the score orders candidates against each other, and the intended use is to select the top few positions for experimental testing.

Two caveats when reading the outputs directly:

- In the **proline** output, positions that are *already* proline typically score high — the model recognizes a proline-compatible environment. The TSV flags these with `already PRO` in its `note` column, since they are not actionable substitutions.
- In the **disulfide** output, every residue carries a B-factor, but only cysteines are biologically meaningful for disulfide formation. The ranked TSV filters to CYS/CYX for this reason; the annotated PDB does not.
- Both annotated PDBs carry a value on *every* residue, including residues each analysis excludes from its ranking — cysteines in the proline output, non-cysteines in the disulfide output. Colour the structure by B-factor and those positions light up too. The ranked TSVs are the filtered view; read them alongside the structure.

### The ranked summaries

Each TSV is ordered by probability, highest first:

| Column | Description |
|---|---|
| `rank` | Position in the ranking, starting at 1 |
| `chain` | Chain identifier (`-` if blank) |
| `pos` | Residue number, with insertion code appended when present |
| `residue` | Three-letter residue name |
| `probability` | Predicted probability, 0–1, two decimal places |
| `note` | Proline analysis only; `already PRO` where applicable |

`<input>_summary.json` carries the same information for programmatic use, capped at the top 25 sites per analysis. The TSVs keep the full ranking.

### Visualizing by score

Because probabilities live in the B-factor column, any structure viewer can color by them. In the BV-BRC viewer, open an annotated PDB and color by B-factor: the highest-scoring positions stand out directly on the structure. The same file loads unmodified in PyMOL (`spectrum b`), ChimeraX, or Mol*.

## Resource estimates

These are ceilings the AppService uses for queue scheduling; actual compute is far below them.

| Resource | Value | Notes |
|---|---|---|
| CPUs | 2 | Sufficient for GNN inference |
| Memory | 1 GB | ~500 MB even for very large structures |
| Time-out | 10 min | Dominated by container staging, not inference |

Inference itself is sub-second for typical proteins; a complete `both` run on a small protein finishes in roughly 12–16 seconds end to end. Scaling is mild with size — disulfiNNate's edge computation grows with the square of residue count, so an 8,000-residue complex takes on the order of 20 seconds rather than 1.

## Reproducibility

The models have fixed trained weights and no sampling step, so the same structure scored twice on the same service version gives the same numbers. This is not a claim about the architecture — it was measured: three runs of the same input produced byte-identical annotated structures for both analyses, and three separately submitted jobs produced byte-identical ranked summaries.

Two things do change results, and both are visible in the report header, which records the input, the models and the exact commands that were run:

- a different input structure, including a re-folded model of the same sequence
- a new service version with retrained models

There is no run-to-run variation to average over. If two of your jobs disagree, one of the two above differs.

## References

- stabiliNNator source: [github.com/schoederlab/stabiliNNator](https://github.com/schoederlab/stabiliNNator)
- Veličković P et al. **Graph Attention Networks.** *ICLR* (2018). [arXiv:1710.10903](https://arxiv.org/abs/1710.10903)
