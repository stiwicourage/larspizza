---
applyTo: "**"
---

# Repository conventions

## Purpose

Canonical cross-cutting rules for the larspizza website repository.

## Project goals

- Build a simple, trustworthy, and easy-to-scan pizzaria website.
- Prefer plain HTML, CSS, and small JavaScript enhancements over unnecessary complexity.
- Keep the project approachable for future edits.

## Structure and ownership

- Use semantic HTML elements such as `header`, `nav`, `main`, `section`, `article`, `footer`, `button`, and proper heading levels when they fit.
- Keep CSS grouped by clear responsibility such as layout, sections, components, or utilities.
- Keep JavaScript small, focused, and tied to clear user-facing behavior.
- Prefer reusing existing classes, patterns, and content blocks over copy-paste duplication.
- Store images and other media in predictable locations under `assets/`.

## UX and content expectations

- Prioritize readability, accessibility, and mobile-friendly layout.
- Keep important user information obvious: menu highlights, prices when shown, opening hours, address, phone number, and ordering calls to action.
- Avoid placeholder text in finished pages unless it is clearly marked for later replacement.
- Use concise, friendly language suitable for a local restaurant website.

## Validation expectations

- Use the smallest validation that proves the change.
- After HTML edits, review structure, headings, links, and content consistency.
- After CSS edits, review likely mobile and desktop behavior and avoid brittle overrides.
- After JavaScript edits, review whether the page still works sensibly when the script fails or is unavailable.
- If the repository later gains automated validation, use the existing project commands instead of inventing new ones.

## Documentation review

- Review `README.md` after changes that affect setup, structure, or contributor workflow.
- Keep `.github` guidance files aligned with the current project structure and working style.

## File formatting rule

- Before handoff, review every changed or created text file and ensure it ends with exactly one trailing newline and no extra blank lines at the bottom.
- Do not alter internal whitespace only to satisfy this rule.

## Safety constraints

- Do not add frameworks, package managers, or build tools unless explicitly requested.
- Do not change restaurant facts such as prices, address, hours, or contact details unless the user requested or confirmed the content change.
