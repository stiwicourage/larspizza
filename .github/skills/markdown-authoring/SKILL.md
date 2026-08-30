---
name: markdown-authoring
description: Guidance for producing clean, copy-safe Markdown for larspizza prompts, agent files, and documentation
---

# Skill: markdown authoring

## When to use

Use this skill when producing Markdown files in the repository or Markdown output that should be easy to copy as-is.

## Relevant files

- `.github/copilot-instructions.md`
- `.github/prompts/*.md`
- `.github/agents/*.md`
- `.github/skills/*/SKILL.md`
- `.github/instructions/*.instructions.md`
- `README.md`

## Expected practices

- Write valid Markdown that is easy to read and paste without cleanup.
- Keep headings, lists, and code fences balanced.
- Prefer concise Markdown that matches the target file's purpose.
- Use fenced code blocks with language identifiers when code examples are needed.

## Common pitfalls

- Unclosed code fences
- Overly verbose sections that hide the useful instruction
- Mixing conversational filler into copy-ready Markdown

## Verification

- Re-read the output as raw Markdown before finalizing it.
- Check that every fence and heading structure is complete.
