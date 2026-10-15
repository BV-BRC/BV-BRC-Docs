# BV-BRC Copilot

*Last updated 15 October 2026*

BV-BRC Copilot is a chat assistant built into the BV-BRC website. You describe what you want in plain language, and Copilot works with BV-BRC on your behalf: it answers questions about BV-BRC and its documentation, searches BV-BRC data, looks through the files in your workspace, prepares and submits analysis jobs, builds genome and feature groups, and helps you read the results of finished jobs.

**Copilot is in beta.** It can misunderstand a request or get a detail wrong. Anything that changes your account, such as submitting a job or creating a group, is shown to you first and only runs after you answer **Yes**, so check what it prepared before you agree. Your feedback (the thumbs on each answer, or **Report Issue** on a chat) helps us improve it.

You need a BV-BRC account and must be logged in to use Copilot.

## Guides

| Page | What it covers |
| --- | --- |
| [Getting started](getting_started.md) | Opening Copilot, asking your first questions, what to expect from an answer |
| [The chat window](interface.md) | Every button: the chat list, the cog menu on each chat, settings, message buttons, the input bar |
| [Plan and Execute modes](plan_and_execute.md) | When Copilot asks before acting, and the Yes / No / Other question |
| [Running jobs and plans](jobs_and_plans.md) | Single jobs, several services, batches of samples, reruns, multi-step plans, finding your results |
| [Data, files and limits](data_files_limits.md) | Data questions, groups, attaching files and screenshots, limits and tips |

## What Copilot can do

| You want to… | Ask, for example |
| --- | --- |
| Learn how BV-BRC works | "How do I compare the proteins of two genomes?" · "What does the Variation service do?" |
| Find data | "How many *Salmonella enterica* genomes from 2023 have antimicrobial resistance data?" |
| Work with your files | "What's in my folder RNAseq_run2?" · "Summarize the results table from my last job" |
| Run an analysis | "Assemble the reads in my folder Isolates_May" · "Run Taxonomic Classification on ERR7916233" |
| Repeat earlier work | "Rerun the jobs in my folder Workshop_2026" |
| Combine steps | "Find the protein family of this gene, make a group of 50 members, and align them" |
| Read the literature | "Find recent papers on carbapenem resistance in *Klebsiella pneumoniae*" |

## Your data

- Your chats are saved to your BV-BRC account and only you can open them. Delete a chat from its cog menu (see [The chat window](interface.md)).
- Files you attach and the results of jobs Copilot submits are saved in your workspace, in a folder for that chat: `home/chats/<chat id>/`. **Open Folder** in the chat's cog menu takes you there.
- Jobs Copilot submits run under your account, exactly like jobs you submit from the service forms, and appear in your Jobs list.
- The language models that power Copilot are hosted at Argonne National Laboratory.

## Need more help?

Use **Report Issue** in a chat's cog menu to send that chat to the BV-BRC team, or contact the help desk from the **Help** menu on the BV-BRC website.
