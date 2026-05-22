# Protein Structure Prediction Service

## Overview

The Protein Structure Prediction Service predicts the 3D atomic structure of proteins, protein complexes, and protein–DNA / RNA / ligand assemblies from sequence input. It exposes five state-of-the-art folding engines through a single unified form:

| Engine | Family | Best for |
|---|---|---|
| **Boltz-2** | Diffusion (co-folding) | Protein + nucleic-acid + ligand / SMILES; binding-affinity-aware |
| **OpenFold 3** | Diffusion (AF3-class, open) | Same scope as Boltz, fully open weights |
| **Chai-1** | Diffusion (AF3-class) | Multi-chain protein complexes, ligands by CCD code |
| **AlphaFold 2** | Co-evolutionary (MSA + Evoformer) | High-accuracy monomer / multimer when MSA is rich |
| **ESMFold** | Single-sequence (protein language model) | Fast, CPU-capable monomers; orphan / designed sequences |

The service picks the best available engine automatically when `Prediction Tool` is left at **Auto**, or you can pin a specific one. Parameter mapping, format conversion (FASTA → YAML / JSON, mmCIF → PDB, A3M → Parquet), and confidence normalization are handled for you. The output is a ranked set of structures plus a unified confidence report.

## See also

- [Protein Structure Prediction Service](https://bv-brc.org/app/PredictStructure)
- [Protein Structure Prediction Tutorial](/tutorial/predict_structure/predict_structure)

## Using the Protein Structure Prediction Service

The **Protein Structure Prediction** submenu option under the **Services** main menu (Protein Tools category) opens the prediction input form. *Note: You must be logged into BV-BRC to use this service.*

## Options

The form is organized as **Prediction Tool**, **Biomolecular Inputs**, **Ligands**, **Multiple Sequence Alignment**, and **Output**. Fields that are not relevant to the selected engine are still visible but ignored (and the help text notes which engines use them).

## Prediction Tool

Choose the structure prediction engine. Leaving this at **Auto** lets the service pick the best available tool given your inputs.

| `tool` value | Engine | Entity support | MSA handling |
|---|---|---|---|
| `auto` | (auto-select) | — | — |
| `boltz` | Boltz-2 | protein, DNA, RNA, CCD ligand, SMILES | Upload required (BV-BRC policy) |
| `openfold` | OpenFold 3 | protein, DNA, RNA, CCD ligand, SMILES | Upload required |
| `chai` | Chai-1 | protein, DNA, RNA, CCD ligand | Upload required |
| `alphafold` | AlphaFold 2 | protein only | Built from BV-BRC's local databases |
| `esmfold` | ESMFold | protein only | None (single-sequence) |

**Auto-select priority** (when `tool = auto`): Boltz → OpenFold → Chai → ESMFold → AlphaFold. The selector inspects your other inputs and falls back as follows:

| Protein | DNA / RNA / ligand / SMILES | MSA File | → Auto picks |
|:-:|:-:|:-:|---|
| ✓ | — | — | ESMFold (fast single-sequence); AlphaFold if ESMFold is unavailable |
| ✓ | — | ✓ | Boltz → OpenFold → Chai → ESMFold → AlphaFold |
| ✓ | ✓ | — | **ERROR** — diffusion tools need MSA; AF / ESMFold cannot use DNA / RNA / ligand |
| ✓ | ✓ | ✓ | Boltz → OpenFold → Chai |
| — | DNA / RNA only | any | Boltz → OpenFold → Chai |

## Biomolecular Inputs

Supply at least one FASTA file with **Protein**, **DNA**, or **RNA** sequences. One file per sequence type. Files come from your workspace.

### Protein

Protein sequence(s) in FASTA format (`.fasta`, `.fa`). For a multi-chain complex, place all chains in a single file — each `>` record is one chain. The service enforces a soft limit of 26 chains and 10,000 total residues per job. Boltz also accepts a native YAML manifest in place of FASTA for full feature support (custom constraints, covalent bonds, modified residues).

### DNA

DNA sequence(s) in FASTA format. Used as co-folding partners with proteins. **Tools that support DNA:** Boltz-2, OpenFold 3, Chai-1. Ignored by AlphaFold 2 and ESMFold.

### RNA

RNA sequence(s) in FASTA format. Same engine support as DNA.

## Ligands

Optional small-molecule ligands to co-fold with the proteins. Supported by Boltz-2, OpenFold 3, and Chai-1.

The form provides one ligand input with a **Notation** selector — pick **CCD codes** or **SMILES strings** and enter one ligand per line. Each notation is validated as you type; the first invalid line is reported inline. Submit can only carry one notation at a time, so if you need both standard cofactors and a novel small molecule, pick the notation that matches your less-trivial entries (typically SMILES for the novel ones).

- **CCD codes** — three-letter Chemical Component Dictionary codes, e.g. `ATP`, `NAD`, `HEM`. Glycans use their CCD codes here too (`NAG`, `MAN`, `BMA`); there is no separate glycan input. Each entry must be 1–3 alphanumeric characters.
- **SMILES strings** — arbitrary small molecules expressed as SMILES (e.g. `CCO` for ethanol). Live syntactic validation surfaces the first invalid line.

## Multiple Sequence Alignment

The **MSA Source** selector controls how the multiple sequence alignment is supplied:

| Source | What happens | When to use |
|---|---|---|
| **None** | No MSA is supplied. | Default. Works with Auto (which will pick ESMFold for single-protein, no-MSA inputs), ESMFold, and AlphaFold 2 (which generates its own MSA from BV-BRC's local databases). |
| **Precomputed MSA from Workspace** | A workspace file selector appears; pick a pre-computed `.a3m`, `.sto`, or `.pqt` file. The service uses it as-is. | Required for Boltz-2, OpenFold 3, and Chai-1. Generate the MSA elsewhere (ColabFold's MMseqs2 server, JackHMMER, or the AlphaFold preprocessing pipeline) and upload the result to your workspace. |
| **Use MSA Server or Service** | Reserved for a future BV-BRC MSA service. Not yet wired up. | Selecting this today displays a notice; switch back to *Precomputed MSA from Workspace* and upload a file. |

Accepted formats for uploaded MSAs:

| Extension | Format | Used by |
|---|---|---|
| `.a3m` | A3M (FASTA-like with lowercase inserts) | Boltz, OpenFold, Chai (after conversion) |
| `.sto` | Stockholm | Boltz, OpenFold, Chai (after conversion) |
| `.pqt`, `.aligned.pqt` | Parquet (Chai-native) | Chai (no conversion) |

ESMFold ignores any MSA. AlphaFold 2 ignores uploaded MSAs and always builds its own from BV-BRC's local databases.

## Output

Every submission creates a **job** with the name you give it. A workspace object named after the job is created inside the Output Folder and holds all job-related info — parameters, status, logs, and the prediction results themselves. The full workspace path is shown in the form's *Result location* bar:

```
<Output Folder>/<Job Name>
```

### Output Folder

The workspace folder where the job will be created. Must already exist, or create one from the folder selector.

### Job Name

Identifier for this run. Used as the workspace object name. Pre-filled with `PredictStructure-<YYMMDD>-<HHMMSS>` so a fresh form always has a unique default; replace it with something descriptive (e.g. `crambin-esmfold`) when it helps.

## Output Results

Every job produces a normalized directory tree, regardless of the underlying engine. This makes downstream comparison and visualization possible without per-tool branching.

```
<job_name>/
├── results.json              # CWL-style output manifest (paths + metadata)
├── report.html               # Interactive HTML viewer (3Dmol.js)
├── inputs/
│   ├── query.fasta           # Canonicalized input
│   ├── msa.a3m               # MSA actually used (if any)
│   └── manifest.yaml
├── predictions/
│   ├── rank_1.pdb            # Top-ranked structure
│   ├── rank_1.cif
│   ├── rank_2.pdb            # ...if --num-samples > 1
│   └── ...
├── reports/
│   ├── confidence.json       # Unified confidence schema
│   ├── plddt.csv             # Per-residue pLDDT
│   └── pae.png               # Predicted aligned error heatmap
├── metadata/
│   ├── tool.json             # Tool name, version, parameters used
│   ├── runtime.json          # Wall time, GPU model, peak memory
│   └── citations.bib
└── raw/                      # Untouched tool-native output (for power users)
```

### Confidence metrics

The unified `confidence.json` contains the metrics common across tools, with tool-specific extras passed through:

| Metric | Range | Meaning |
|---|---|---|
| `plddt_mean` | 0–100 | Per-residue confidence averaged across the chain. >90 highly confident; 70–90 confident; 50–70 low; <50 disordered |
| `ptm` | 0–1 | Predicted TM-score for monomer / multimer global fold |
| `iptm` | 0–1 | Interface predicted TM-score (multi-chain / ligand interfaces) |
| `model_confidence` | 0–1 | Aggregate ranking score (tool-specific weighting of pTM, ipTM, pLDDT) |

### Visualizing the structure

Open `report.html` in the workspace viewer. The page embeds [3Dmol.js](https://3dmol.csb.pitt.edu/) with chain-colored, pLDDT-colored, and confidence-colored representations, plus a draggable PAE heatmap.

### Action buttons

After selecting an output file by clicking it, the right-hand Action Bar offers:

- **Hide / Show** — toggles the Details Pane
- **Guide** — link to this Quick Reference
- **Download** — downloads the selected file
- **View** — opens the file (PDB → 3Dmol viewer, HTML → rendered, JSON → text)
- **Delete / Rename / Copy / Move** — standard workspace operations

## Resource estimates

These are conservative ceilings the AppService uses for queue scheduling. Actual runtime is usually well below the cap.

| Tool | CPUs | Memory | Default time-out | Typical 200 aa monomer |
|---|---|---|---|---|
| Boltz-2 | 8 | 64 GB | 4 h | 1–3 min |
| OpenFold 3 | 8 | 64 GB | 4 h | 2–5 min |
| Chai-1 | 8 | 64 GB | 4 h | 2–5 min |
| AlphaFold 2 | 16 | 96 GB | 8 h | 30–90 min (MSA + 5 models) |
| ESMFold | 8 | 32 GB | 1 h | 20–60 s (GPU) / 2–6 min (CPU) |

## References

- Jumper J et al. **Highly accurate protein structure prediction with AlphaFold.** *Nature* 596, 583–589 (2021). [doi:10.1038/s41586-021-03819-2](https://doi.org/10.1038/s41586-021-03819-2)
- Lin Z et al. **Evolutionary-scale prediction of atomic-level protein structure with a language model.** *Science* 379, 1123–1130 (2023). [doi:10.1126/science.ade2574](https://doi.org/10.1126/science.ade2574)
- Abramson J et al. **Accurate structure prediction of biomolecular interactions with AlphaFold 3.** *Nature* 630, 493–500 (2024). [doi:10.1038/s41586-024-07487-w](https://doi.org/10.1038/s41586-024-07487-w)
- Wohlwend J et al. **Boltz-1: democratizing biomolecular interaction modeling.** bioRxiv (2024). [doi:10.1101/2024.11.19.624167](https://doi.org/10.1101/2024.11.19.624167)
- Passaro S et al. **Boltz-2: towards accurate and efficient binding affinity prediction.** bioRxiv (2025). [PMC12262699](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC12262699/)
- Chai Discovery. **Chai-1: decoding the molecular interactions of life.** bioRxiv (2024). [doi:10.1101/2024.10.10.615955](https://doi.org/10.1101/2024.10.10.615955)
- Ahdritz G et al. **OpenFold: retraining AlphaFold2 yields new insights into its learning mechanisms and capacity for generalization.** *Nature Methods* 21, 1514–1524 (2024).
- Mirdita M et al. **ColabFold: making protein folding accessible to all.** *Nature Methods* 19, 679–682 (2022).
