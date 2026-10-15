# The Copilot chat window

This page describes every part of the Copilot window. The full-page view (**Tools & Services → AI → Chat**) and the floating window (the chat button in the lower-right corner) work the same way, except for the floating window's header.

## Floating window header

The floating window has a header bar titled **BV-BRC Copilot - BETA**. Drag it to move the window; drag any edge or corner to resize it.

| Button | What it does |
| --- | --- |
| **☰** (Close/Open Sidebar) | Shows or hides the list of chats on the left. |
| **⚙** (Advanced Options) | Opens the settings popup. **Text Size** sets the size of chat text (default 14); the setting is remembered in this browser. |
| **ⓘ** (Copilot Overview) | Shows a short overview of Copilot with a link to this documentation. |
| **X** (Close) | Hides the window. Your chat is kept; click the chat button to bring it back. |

The full-page view has no header bar; its chat list is always shown and can be resized by dragging its edge.

## The chat list (left side)

- **New Chat** starts a new, empty chat. Every new chat starts in [Plan mode](plan_and_execute.md).
- Below it are your chats, newest first, each showing its title and date. Click a chat to open it. **Load More Sessions** at the bottom shows older chats.
- The open chat is highlighted.
- A blue **Running** label on a chat means Copilot is still working on an answer in it. You can switch to another chat meanwhile; the answer is saved when it finishes.

## The cog menu on each chat

Each chat in the list has a cog icon (**Session actions**). Click it for:

| Item | What it does |
| --- | --- |
| **Edit Title** | Renames that chat: its title in the list becomes a text box. **Enter** saves, **Esc** cancels. (You can also click the title at the top of an open chat.) |
| **Rate** | Gives the whole conversation 1 to 5 stars. |
| **View Jobs** | Lists the jobs submitted from this chat: job ID, service, status, when it was submitted, and a **View Output** link to the results folder. |
| **Open Folder** | Opens this chat's folder in your workspace (`home/chats/<chat id>/`) in a new tab. Attached files and job results are there. |
| **Report Issue** | Opens the BV-BRC **Report a Problem** form with that chat attached, so the team can see what happened. |
| **Delete** | Asks you to confirm, then removes the chat from your list. It cannot be undone. Files and job results already in your workspace are not deleted. |

## The title

The chat's title is shown at the top of the chat. A new chat is titled **New Chat** until Copilot names it after its first answer, using your first message. Click the title to edit it: **Enter** saves, **Esc** cancels.

## Messages

**Under each answer from Copilot:**

| Button | What it does |
| --- | --- |
| Copy | Copies the answer's text (as Markdown) to your clipboard. |
| Thumbs up / thumbs down | Rates this answer. Ratings help the BV-BRC team find good and bad answers. |

**Under each of your messages** (shown when you point at it):

| Button | What it does |
| --- | --- |
| Copy | Copies your message. |
| Retry | Sends the same message again, for a fresh answer. |

Other things you may see in the chat:

- Long code blocks are folded; click **Show more** to open them.
- Workspace paths in an answer are shown as folder chips; click one to open that folder in a new tab.
- **Prepared — nothing submitted yet** cards: Copilot's question before it submits a job or creates a group. See [Plan and Execute modes](plan_and_execute.md).
- **Plan** cards: a multi-step plan with buttons to approve and follow it. See [Running jobs and plans](jobs_and_plans.md).
- **Before I create a plan, I have a few questions:** pick an answer for each question (or type your own) and click **Submit Answers**.

When an answer finishes while you are scrolled up, a **New response** button appears at the bottom of the chat. The **↓** button (shown whenever there is more below) jumps to the latest message.

## The input bar

From left to right:

| Control | What it does |
| --- | --- |
| Paperclip (**Attach**) | **Screenshot** captures the page you are viewing and attaches it. **Upload File** attaches files from your computer. **Add Workspace Path** lets you pick a file or folder from your workspace and puts its path into your message. See [Data, files and limits](data_files_limits.md). |
| **Plan / Execute** | Whether Copilot asks before submitting jobs and creating groups (**Plan**, the default) or may do so directly (**Execute**). Saved per chat. See [Plan and Execute modes](plan_and_execute.md). |
| Message box | Type here. **Enter** sends, **Shift+Enter** starts a new line. Up to 10,000 characters. |
| Send | Sends your message. |
| **Stop** | Shown while Copilot is answering. Stops the answer; what was written so far is kept. |

Attached files, the screenshot and any workspace paths in your message appear as chips above the box. Click **×** on a chip to remove it.

## Keyboard shortcuts

| Where | Key | Effect |
| --- | --- | --- |
| Message box | Enter | Send |
| Message box | Shift+Enter | New line |
| Chat title | Enter / Esc | Save / cancel |
| Attach menu, View Jobs | Esc | Close |
