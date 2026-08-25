# Protein Stability Prediction Service (stabiliNNator)

## Overview

The Protein Stability Prediction Service identifies positions in an existing protein structure where a targeted mutation is likely to increase thermal stability. It takes a 3D structure — not a sequence — and scores every residue with a graph neural network.

Two complementary analyses are available, and they can be run together in one job:

| Analysis | Question it answers | Scored residues |
|---|---|---|
| **proliNNator** | Which positions would tolerate, or benefit from, substitution to proline? | All standard amino acids |
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

### Input Structure File

A protein structure in **PDB** or **mmCIF** format, selected from your workspace. The structure must contain standard amino acids with CA atoms — the graph is built from residue positions, so a backbone trace at minimum is required.

Two input characteristics are handled automatically:

- **NMR / multi-model ensembles.** Only the first model is scored. Without this, a 38-model ensemble of a 20-residue peptide would be read as 760 concatenated residues and the scores would be meaningless.
- **Multiple chains.** All chains present are scored; results identify each residue by chain, position, and insertion code.

### Analysis Type

Which analysis to run.

| Value | Runs | Produces |
|---|---|---|
| `both` *(default)* | proliNNator and disulfiNNate | Both annotated PDBs and both ranked summaries |
| `proline` | proliNNator only | Proline outputs only |
| `disulfide` | disulfiNNate only | Disulfide outputs only |

`both` is the common case; the two analyses are independent and together take only a few seconds longer than either alone.

### Report Theme

Visual styling for the generated HTML report.

| Value | Description |
|---|---|
| `bvbrc` *(default)* | Matches BV-BRC portal styling |
| `editorial` | Alternative editorial layout |

This affects presentation only — the underlying results are identical.

### Advanced options

These rarely need changing.

| Field | Default | Description |
|---|---|---|
| **Compute Device** | `cpu` | `cpu` or `gpu`. CPU is recommended and is normally *faster*: the models are small (14–22 KB), so CUDA initialization overhead exceeds any compute savings. |
| **Hidden Dimension** | `32` | Network hidden dimension. Both shipped models were trained with 32; change only when supplying custom-trained models. |
| **Dry Run** | off | Validates workspace access and input parsing, then stops without running predictions. |

## Output

Every submission creates a **job** with the name you give it. A workspace object named after the job is created inside the Output Folder and holds all job-related information — parameters, status, logs, and the results themselves.

```
<Output Folder>/<Job Name>
```

### Output Folder

The workspace folder where the job will be created. Must already exist, or create one from the folder selector.

### Job Name

Identifier for this run, used as the workspace object name. Results are written to `<Output Folder>/.<Job Name>/`. Give each run its own name; two jobs sharing a name write into the same folder.

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

The value in the B-factor column is a probability from 0 to 1. **Higher means a more favorable predicted site.** These are rankings, not free-energy predictions: the score orders candidates against each other, and the intended use is to select the top few positions for experimental testing.

Two caveats when reading the outputs directly:

- In the **proline** output, positions that are *already* proline typically score high — the model recognizes a proline-compatible environment. The TSV flags these with `already PRO` in its `note` column, since they are not actionable substitutions.
- In the **disulfide** output, every residue carries a B-factor, but only cysteines are biologically meaningful for disulfide formation. The ranked TSV filters to CYS/CYX for this reason; the annotated PDB does not.

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

## References

- stabiliNNator source: [github.com/schoederlab/stabiliNNator](https://github.com/schoederlab/stabiliNNator)
- Veličković P et al. **Graph Attention Networks.** *ICLR* (2018). [arXiv:1710.10903](https://arxiv.org/abs/1710.10903)
