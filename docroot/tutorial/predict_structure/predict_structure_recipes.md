# Protein Structure Prediction — Recipes

This is a cookbook for the Protein Structure Prediction service. If you're new to the service, start with the [Tutorial](/tutorial/predict_structure/predict_structure) — it walks you through a single-protein prediction end-to-end. Once you're comfortable with the form, the recipes here cover the patterns that go beyond the defaults: multi-chain complexes, ligands, MSAs you supply or have computed, and reruns.

For the full reference of every form field see the [Quick Reference Guide](/quick_references/services/predict_structure_service).

## Choosing a recipe

| Your situation | Recipe |
|---|---|
| Single protein, just want a structure | [Tutorial](/tutorial/predict_structure/predict_structure) — uses Auto → ESMFold |
| Multi-chain protein complex | [Multi-chain complex with Boltz](#recipe-1-multi-chain-protein-complex-with-boltz) |
| Protein + a small-molecule cofactor (ATP, NAD, …) | [Protein + ligand by CCD code](#recipe-2-protein-with-a-cofactor-ccd-code) |
| Protein + a novel small molecule | [Protein + SMILES ligand](#recipe-3-protein-with-a-smiles-ligand) |
| Need an MSA but don't have one | [Let BV-BRC compute the MSA](#recipe-4-let-bv-brc-compute-the-msa-with-colabfold) |
| Have an MSA, want best-quality fold | [Boltz / OpenFold / Chai with uploaded MSA](#recipe-5-uploaded-msa-with-boltz-openfold-or-chai) |
| Already ran one — try a different engine | [Rerun with a different tool](#recipe-6-rerun-an-existing-job-with-a-different-tool) |

## Recipe 1 — Multi-chain protein complex with Boltz

**Goal:** predict the structure of a complex (e.g. an antibody Fv with heavy + light chains, or a homo-tetramer).

**Inputs:** one FASTA file with multiple `>` records — each record becomes one chain. Soft limit: 26 chains and 10,000 total residues per job.

```
>heavy_chain
QVQLVQSGAEVKKPGASVKVSCKASGYTFT...
>light_chain
DIQMTQSPSSLSASVGDRVTITCRASQDIS...
```

**Form settings:**

| Field | Value |
|---|---|
| Prediction Tool | `Boltz` (or Auto if you've uploaded an MSA) |
| Protein | the multi-chain FASTA |
| MSA Source | *Use MSA Server or Service* (recommended) or *Precomputed MSA from Workspace* if you already have one |
| Other inputs | leave empty |
| Job Name | something descriptive — e.g. `antibody-fv-boltz` |

**Why Boltz for complexes?** Boltz, OpenFold 3, and Chai-1 are all AF3-class diffusion models with strong multimer performance. Boltz is the auto-selector's first choice when an MSA is available; OpenFold and Chai are reasonable swaps if you want to compare.

## Recipe 2 — Protein with a cofactor (CCD code)

**Goal:** fold a protein with a known cofactor in place (e.g. an ATP-binding domain with ATP modeled).

**Inputs:** the protein FASTA plus a CCD code in the Ligands input.

**Form settings:**

| Field | Value |
|---|---|
| Prediction Tool | `Boltz` (or Auto) |
| Protein | your FASTA |
| Ligands → Notation | `CCD codes` |
| Ligands → input | `ATP` (one per line if you have more) |
| MSA Source | *Use MSA Server or Service* or *Precomputed* |

Common CCD codes: `ATP`, `ADP`, `GTP`, `NAD`, `FAD`, `HEM`, `MG`, `ZN`, `CA`. Glycans use their CCD codes too (`NAG`, `MAN`, `BMA`).

**Limitation:** the form's Notation selector carries one notation per submission. To mix CCD ligands and SMILES ligands in the same job, you need the CLI (see [CLI Reference](/quick_references/services/predict_structure_cli)).

## Recipe 3 — Protein with a SMILES ligand

**Goal:** fold a protein with a novel small molecule (no CCD code yet) in place — e.g. a drug candidate.

**Inputs:** the protein FASTA plus the molecule as a SMILES string.

**Form settings:**

| Field | Value |
|---|---|
| Prediction Tool | `Boltz` |
| Protein | your FASTA |
| Ligands → Notation | `SMILES strings` |
| Ligands → input | the SMILES (e.g. `CCO` for ethanol, one per line for multiple) |
| MSA Source | *Use MSA Server or Service* |

The form validates SMILES as you type; the first invalid line is reported inline. Standard SMILES syntax — branching parentheses must balance, atoms come from the typical organic set + halogens.

**Tip:** if you have the molecule's 2D structure in another tool (e.g. RDKit, ChemDraw), export to canonical SMILES first.

## Recipe 4 — Let BV-BRC compute the MSA with ColabFold

**Goal:** predict a structure that needs an MSA, but you don't have one and don't want to build it yourself.

**Form settings:**

| Field | Value |
|---|---|
| Prediction Tool | `Boltz`, `OpenFold`, or `Chai` |
| Protein | your FASTA |
| MSA Source | **Use MSA Server or Service** |

The service runs MMseqs2 against UniRef + ColabFoldDB and feeds the result to the selected engine. Expect 30 s – 3 min of extra wall time before folding starts.

**When *not* to use this:** if you already have an MSA from your own pipeline (JackHMMER, ColabFold local, etc.), upload it instead — your MSA is likely deeper / better filtered than the server's defaults.

## Recipe 5 — Uploaded MSA with Boltz, OpenFold, or Chai

**Goal:** highest-quality fold, with an MSA you've curated.

**Inputs:** a `.a3m`, `.sto`, or `.pqt` MSA file uploaded to your workspace.

**Form settings:**

| Field | Value |
|---|---|
| Prediction Tool | `Boltz` (default), or `OpenFold` / `Chai` to compare |
| Protein | the query FASTA matching the MSA's first sequence |
| MSA Source | **Precomputed MSA from Workspace** |
| MSA File | the uploaded `.a3m` / `.sto` / `.pqt` file |

The service auto-converts A3M ↔ Parquet for the engine that needs it. Stockholm is converted to A3M-internally for Boltz / OpenFold.

**Tip:** a deeper MSA (more sequences) usually helps until ~256 effective sequences, after which gains flatten. ColabFold's default depth of 5,000 raw → ~256 effective is a reasonable target.

## Recipe 6 — Rerun an existing job with a different tool

**Goal:** you've run a fold and want to compare a different engine on the same inputs.

1. Open the completed job in your workspace.
2. Click the **Rerun** button in the Action Bar.
3. The form re-opens pre-filled with the prior submission's parameters.
4. Change the **Prediction Tool** to the engine you want to compare against.
5. Update the **Job Name** (the default will collide otherwise — `crambin-esmfold` → `crambin-boltz`, etc.).
6. **Submit**.

This is the cleanest way to A/B-test engines without rebuilding the form from scratch.

## What's not on the form

These advanced knobs are *not* surfaced on the web form. Reach them via the CLI or JSON-RPC API:

- `num_samples` — how many independent predictions to generate (default 5; useful for assessing ensemble disagreement)
- `num_recycles` — recycling iterations (engine-specific defaults; AlphaFold defaults to 3)
- `seed` — random seed for reproducibility (engine-specific)
- `output_format` — restrict output to a subset (`pdb`, `cif`, `report`, `confidence`, …)
- Per-engine flags — see each engine's adapter in `PredictStructureApp/adapters/`

See the [CLI Reference](/quick_references/services/predict_structure_cli) and [API Reference](/quick_references/services/predict_structure_api) for the full parameter surface.

## See also

- [Protein Structure Prediction Service Tutorial](/tutorial/predict_structure/predict_structure) — the novice walkthrough
- [Quick Reference Guide](/quick_references/services/predict_structure_service) — every form field, by section
- [Protein Structure Prediction Service](https://bv-brc.org/app/PredictStructure) — open the form
