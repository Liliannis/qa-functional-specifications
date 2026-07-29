---
name: review-markdown-before-commit
description: Review a Markdown file before committing to ensure structure, clarity, consistency, and basic correctness.
---

# Review Markdown before commit

Use this skill whenever a Markdown file is about to be committed.

## Objective
Ensure the document is clear, well-structured, and safe to include in the repository.

## Review checklist
1. Read the target Markdown file and, if needed, the surrounding context in the repository.
2. Check the heading hierarchy and overall structure.
3. Verify lists, tables, links, and code blocks are correctly formatted.
4. Review grammar, consistency, and wording for clarity.
5. Look for placeholders, unfinished sections, duplicate content, or sensitive information.
6. Confirm the content matches the purpose of the repository and the change being committed.

## Expected output
- A short summary of the document status.
- Any issues found, grouped by severity.
- Suggested fixes or improvements.
- A final recommendation: approve, revise, or reject before commit.

## Working rules
- Do not silently approve the file; provide a concrete review.
- Prefer concise and actionable feedback.
- If the file is incomplete or misleading, recommend changes before commit.
