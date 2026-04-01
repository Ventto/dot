---
name: ventto-collab-tools
description: Use for collaboration tasks in ventto's GitLab, Jira, and Slack workflows. Trigger for merge request creation or updates, MR titles or descriptions, GitLab comments, Jira ticket edits, epic updates, status changes, field changes, descriptions, Slack channel discovery, and Slack link sharing where actions require an explicit pre-action summary, English text, confirmation before modifying GitLab or Jira, Slack channel searches must include channel_types public_channel and private_channel, and Slack links must use app.slack.com/client.
---

# Ventto Collaboration Tools

Apply these rules for GitLab, Jira, and Slack tasks.

## GitLab

- MR titles, descriptions, and comments must be written in English.
- Before any GitLab action, show a full summary of what will be done and wait for explicit confirmation.

GitLab actions include:

- create MR
- post comment
- update MR

## Slack

- When searching for a channel by name, always include `channel_types: public_channel,private_channel`.
- Use `https://app.slack.com/client/` links, never `https://spoonai.slack.com/archives/`.

## Jira

Before any Jira modification:

- State what you are about to do.
- Wait for confirmation.
- For ticket or epic additions or edits, show a summary of all intended changes first.

That summary should include, when relevant:

- title
- fields
- description
