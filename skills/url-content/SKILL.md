---
name: url-content
description: Use when a user message contains URL(s) and the task may require reading, summarizing, reviewing, installing from, or otherwise relying on linked content.
---

# URL Content Handling

When the user's message contains one or more URLs and the task requires understanding, summarizing, reviewing, installing from, or otherwise using the linked content:

1. Call `fetch_content` on the relevant URL(s) before answering or acting.
2. For GitHub repository URLs, prefer `fetch_content` so the repository can be cloned/extracted locally.
3. Use `web_search` for open-ended research or freshness-sensitive questions rather than for fetching a known URL.
4. Do not fetch URLs that are clearly only examples, placeholders, or explicitly marked as not needing access.
