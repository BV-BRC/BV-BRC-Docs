# Plan and Execute modes

Two kinds of request change your account: **submitting an analysis job** and **creating a genome or feature group**. The **Plan / Execute** switch next to the message box decides whether Copilot asks you first. Everything else (answering questions, searching data, reading your files) works the same in both modes.

## Plan mode (the default)

Copilot does all the preparation (it picks the service, finds your files or SRA runs, checks identifiers and fills in every setting) but does not submit or create anything. Instead it shows a card titled **Prepared — nothing submitted yet** that lists exactly what it would run, and asks one question, for example **Submit this job?** or **Create these 2 groups?**

| Your answer | What happens |
| --- | --- |
| **Yes** (for example **Yes, submit it**) | Runs exactly what the card lists, once. Copilot does not re-guess anything. The chat stays in Plan mode. |
| **No** | Nothing runs. The card then asks **Should anything be changed?** so you can describe a change, or leave it. |
| Type a change and click **Send** | Copilot revises what it prepared ("use the Unicycler recipe", "drop the second job") and asks again. Nothing runs until you answer **Yes** to the new card. |

Each card takes one answer, and the answer stays on the card when you come back to the chat.

**Check the card before you answer Yes.** It shows the service, the input files or IDs, and where the results will go. Copilot is in beta and can pick the wrong file or setting; the card is your chance to catch it.

## Execute mode

Click **Execute** to let Copilot submit a single job, or create groups, as soon as it has everything it needs, without the question. The message box shows *(execute mode)* as a reminder. The setting is saved for this chat only; a new chat starts in Plan mode.

Execute mode means Copilot *may* act, not that it must: it still asks you when the request is unclear or a required setting is missing.

## When Copilot always asks

Even in Execute mode, Copilot prepares the work and asks first when:

- **More than one job would run** (several services on one sample, or one service on several samples). You confirm the whole set with one question.
- **Rerunning earlier jobs.** The settings are copied from old jobs, so you see them before they run.
- **A batch of samples** from a folder or a list of SRA runs. The files were matched by Copilot, so you check the pairing first.

Copilot prepares at most 10 jobs per message. If a request needs more, it says so and asks which to run first.

## Plans

A multi-step plan works in either mode. In Plan mode, each step that would submit a job or create a group stops with its own question; the plan continues after you answer **Yes**. See [Running jobs and plans](jobs_and_plans.md).
