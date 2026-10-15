# Running jobs and plans with Copilot

Copilot can run BV-BRC analysis services for you. It uses the same services as the forms under **Tools & Services**, and the jobs run under your account. In [Plan mode](plan_and_execute.md) it always shows you what it prepared and asks before submitting.

## One job

Ask for the analysis and name the input:

- "Assemble the reads in my folder Isolate_07"
- "Run Taxonomic Classification on ERR7916233"
- "Annotate the contigs file from my last assembly"

Copilot finds the right service, looks up your files or SRA runs, fills in the settings (using the service defaults unless you say otherwise) and shows the prepared job. If something only you can decide is missing, such as the organism for a genome annotation, it asks.

**Experimental services.** A few services are known to fail at the moment (for example Tree Sort and Protein Structure Prediction). Copilot tells you before preparing them and suggests an alternative when there is one.

## Several services on one sample

"Run Taxonomic Classification and Metagenomic Binning on ERR7916233" prepares both jobs and asks once (**Submit these 2 jobs?**). If you ask for "all the relevant services", Copilot prepares them when there are three or fewer, and otherwise lists them and asks which you want.

## One service on many samples (batches)

- "Run Genome Assembly on every read pair in my folder Run_42"
- "Assemble SRR1234567, SRR1234568 and ERR7916233"

Copilot lists the samples (it pairs read files by name, such as `_R1`/`_R2` or `_1`/`_2`), prepares one job per sample, and asks once. Files whose mate is missing are listed and left out. Only the folder itself is searched, not its subfolders. For services that analyse samples together (such as RNA-Seq), ask for "one job with all the samples".

## Rerunning earlier jobs

- "Rerun job 23723886"
- "Rerun all the jobs in my folder Workshop_2026"

Copilot copies each job's original settings, puts the new results in this chat's folder with `_rerun` added to the name, and asks once. Jobs that are still running, or that use a service it cannot rerun, are listed with the reason.

## Multi-step plans

When one task feeds the next, such as finding data, making a group, and running a service on it, Copilot may propose a **plan**: a card listing the steps, which part of BV-BRC does each, and which steps depend on others.

- **Approve & Execute** starts the plan. **Edit Plan** lets you change, add or delete steps first. **Regenerate** asks for a new plan.
- Steps run in order. A step that would create a group or submit a job stops with its own question (⏸ *Waiting for your answer to the question below*); answer **Yes** and the plan continues, or click **Skip this step**.
- Each group gets its own step, built from its own selection (for example resistant and susceptible genomes in two separate steps).
- A step that needs a job to finish waits for it; when the job is done, click **Continue Plan**.
- A failed step shows **Retry** and **Skip**. **Pause** / **Resume** stop and restart a running plan.
- Copilot may ask **Before I create a plan, I have a few questions:** first; answer them and click **Submit Answers**.

## Where your results go

- Each job's results are saved in your workspace in this chat's folder, `home/chats/<chat id>/`, in a subfolder named after the job. **Open Folder** in the chat's cog menu opens it.
- The prepared-job card and the answer after **Yes** show the exact folder.
- **View Jobs** in the chat's cog menu lists this chat's jobs with their status and a **View Output** link. All your jobs also appear in the usual Jobs list.
- When a job finishes, a message saying whether it succeeded is added to the chat. You see it when the chat is open, or the next time you open or reload it.
- To look at results, ask in the same chat, for example "Summarize the assembly results" or "Which genes are most differentially expressed?"
