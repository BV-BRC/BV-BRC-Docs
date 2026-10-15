# Getting started with BV-BRC Copilot

## Opening Copilot

Log in to BV-BRC first; Copilot is only available to logged-in users.

| Where | How |
| --- | --- |
| Any BV-BRC page | Click the round blue chat button in the lower-right corner. Copilot opens in a window you can move and resize, and the page stays usable behind it. Click the button again to hide the window; your chat is kept. |
| Full page | In the top menu choose **Tools & Services → AI → Chat**. Copilot fills the page, with your list of chats on the left. The floating chat button is hidden on this page. |

Both views show the same chats. Copilot reopens the chat you last used.

## Your first chat

1. Click **New Chat** at the top of the chat list (a new chat also opens the first time you visit).
2. Type a request in the box at the bottom and press **Enter** (use **Shift+Enter** for a new line).
3. If you are not sure what to ask, a new chat shows **Try asking:** with a few suggestions. Clicking one copies it into the box so you can edit it before sending.

While Copilot works you see short status lines, such as which part of BV-BRC it is searching. A long answer can take a minute or more; press **Stop** to cancel it. When an answer finishes while you are scrolled up, a **New response** button appears at the bottom of the chat; click it to jump to the end.

After the first answer the chat gets a short title based on your first message. Click the title at the top of the chat to rename it.

## What a good answer looks like

- **Links you can follow.** Answers link to the BV-BRC pages, tables and workspace folders they used, so you can check them. Links open in a new tab.
- **Counts with their basis.** For "how many" questions Copilot says what it counted (genomes, or records per genome).
- **Prepared work, not surprises.** When you ask for a job or a group, Copilot shows exactly what it would run and asks before running it. See [Plan and Execute modes](plan_and_execute.md).

## Asking well

- **Name the thing precisely**: a genome ID (`83332.12`), an SRA run (`SRR1234567`), a workspace folder name, or the full species name.
- **Say what you want back**: a count, a table, a group, a job, an explanation.
- **One task per message** works best. For several connected tasks, ask for them together and Copilot may propose a plan (see [Running jobs and plans](jobs_and_plans.md)).
- **Follow up in the same chat.** Copilot sees the recent messages of the chat, so "now make a group of those" or "run the same on the next sample" works.
- **Start a new chat for a new topic.** Long chats about unrelated things make answers slower and less focused.

## When something goes wrong

- A red message with **Reload Session** means the connection dropped or the server had an error. Click **Reload Session**; your chat is saved on the server, including any answer that finished in the meantime.
- If Copilot says another answer is still running in this chat, wait for it or press **Stop**, then send again.
- Use the thumbs down on an answer that was wrong, or **Report Issue** from the chat's cog menu to send the chat to the BV-BRC team.
