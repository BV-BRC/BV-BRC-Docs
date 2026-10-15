# Data, files and limits

## Asking about BV-BRC data

Copilot searches the same data you see in the BV-BRC tables: genomes, genes and proteins, antimicrobial resistance, specialty genes, pathways, subsystems, protein families, and more.

- "How many *Mycobacterium tuberculosis* genomes are reference or representative genomes?"
- "Which *Escherichia coli* genomes from 2024 were isolated from cattle in the USA?"
- "What is the protein family of fig|83332.12.peg.3062?"

Answers include links to the matching BV-BRC table and, where possible, a download link. For counts, Copilot says what it counted: some tables, such as antimicrobial resistance, have several records per genome, so "how many genomes" and "how many records" differ.

**Use full species names.** "*Streptococcus pneumoniae*" finds that species; a partial name such as "pneumoniae" also matches *Klebsiella pneumoniae* and others.

**Antimicrobial resistance data** comes from laboratory tests and from computational predictions, and one genome can have records of both kinds that disagree. If it matters for your analysis, say which you want, for example "laboratory-tested genomes only".

## Genome and feature groups

Copilot can save results as a group in your workspace (`home/Genome Groups/` or `home/Feature Groups/`):

- "Make a genome group of the reference *Salmonella* genomes, named salmonella_ref"
- "Add these genomes to my group study_set"

It tells you how many members the group will have before you answer **Yes**. Groups made for two conditions (for example resistant and susceptible) are each built from their own selection, and Copilot will not create two groups with exactly the same members.

## Your workspace files

Copilot can list your folders, open files, search inside them, and summarize tables and sequence files, including results of finished jobs.

- "What's in my folder Run_42?"
- "How many rows in the results table have a p-value below 0.05?"
- "What is the N50 of the contigs from my last assembly?"

To point Copilot at a file, type its workspace path or use **Attach → Add Workspace Path** to pick it. Copilot looks in this chat's folder first when you say "my results" or "the file I uploaded".

## Attaching files

Use the paperclip (**Attach**) next to the message box:

| Item | Accepts | Limit |
| --- | --- | --- |
| **Screenshot** | A picture of the page you are viewing, so Copilot can see the table, form or report you are asking about | Not available with every model |
| **Upload File**: images | PNG or JPEG | 6 MB each |
| **Upload File**: PDFs | Papers, reports | 10 MB each; text only (scanned PDFs without selectable text cannot be read) |
| **Upload File**: text files | FASTA, CSV, TSV, JSON, plain text and other text formats | 10 MB each |

- At most **3 attachments per message**. Other binary files (such as Word, Excel or zip files) are not accepted.
- Uploaded text files and PDF text are saved in this chat's folder (`home/chats/<chat id>/uploaded_files/` and `parsed_pdfs/`), so Copilot and you can use them later, for example as the input of a job.
- Copilot reads the first part of a long attachment directly and the rest from the saved copy when it needs to.

## Limits

| Limit | Value |
| --- | --- |
| Jobs prepared per message | 10 |
| Attachments per message | 3 |
| Message length | 10,000 characters |
| One answer at a time per chat | Wait for the current answer, or press **Stop**, before sending again |
| Time per answer | About 5 minutes; a very large request may stop with a partial answer. Split it, or narrow it down. |

## Tips

- If an answer looks wrong, ask Copilot how it got it ("which query did you use?"); it can show its search.
- For a large or vague request ("everything about plant viruses"), start with a narrower question.
- Check prepared jobs and groups before answering **Yes**: the service, the inputs, and the number of members.
- Copilot is in beta. Use the thumbs and **Report Issue** to tell us what went wrong.
