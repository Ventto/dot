---
name: gitlab-feature-mr
description: Create GitLab merge requests for the current repository with a consistent title and description template. Use when Codex needs to open or draft a GitLab MR, especially when the current branch follows the pattern `feature/ticket-jira-id_branch-title` and the MR title must be prefixed with the Jira ticket key.
---

# GitLab Feature MR

Create the merge request from the repository the user is currently working in.

## Workflow

1. Detect the current branch name.
2. If the branch matches `feature/<ticket-jira-id>_<branch-title>`, extract:
   - `ticket-jira-id`
   - `branch-title`
3. Build the MR title with the Jira key as prefix.
4. Build the MR description from the template below.
5. Before creating the MR, show the user the proposed title and description if confirmation is required by other active instructions.

## Title Rules

- For a branch matching `feature/<ticket-jira-id>_<branch-title>`, use `<ticket-jira-id>: <human-readable branch title>`.
- If the user already provided a title, keep it but add `<ticket-jira-id>:` at the start if it is missing.
- Do not duplicate the Jira key if the title already starts with it.
- Convert the branch title into readable text by replacing `-` and `_` with spaces.
- Keep the Jira key exactly as it appears in the branch name.

## Description Template

Use this MR description template and replace placeholders with the current task details:

```md
### 📖 Description

- <change summary 1>
- <change summary 2>
- <change summary 3>

---
### 🧪 How to Test

- <test step 1>
- <test step 2>

---

### 📎 Additional Notes

- Jira: [<ticket-jira-id>](https://spoonai.atlassian.net/browse/<ticket-jira-id>)

---
### 🧾 Review & Draft Guidelines

- Assign reviewers required by **CODEOWNERS** manually
- If the implementation is **still in progress**, keep the MR in **Draft** state (e.g., title starts with `Draft:` or marked explicitly) so that the reviews can know how to start reviewing unless you ask them directly for early feedback
- When the MR is **ready for review**, click **“Mark as ready”** in GitLab to signal reviewers
```

## Required Checks

- Ensure the Jira key used in the title and in the link is the same value.
- If the branch does not match the feature pattern, do not invent a Jira key.
- If the user gives a custom template, prefer the user template over this default one.
- Keep the MR description concise and concrete. Avoid placeholder text in the final MR.

## Example

For branch `feature/EN-3051_add-workflow-rules`, propose:

- Title: `EN-3051: add workflow rules`
- Jira link: `https://spoonai.atlassian.net/browse/EN-3051`
