# Design a larspizza website change

> Invoke with `@.github/prompts/design-change.prompt.md`. Delegates to the `architect` agent.

Use this prompt when a website change still needs analysis, scoping, and agreement before implementation starts.

## Required process

1. Clarify the real goal first. Ask focused follow-up questions only when they will change scope or implementation.
2. Read the minimum repository context needed to ask informed questions.
3. Identify which pages, assets, content areas, and interactions are likely affected.
4. If multiple reasonable directions exist, present 2-3 concrete options with trade-offs.
5. Treat out-of-scope boundaries as proposals until the user confirms them.
6. When the core scope is settled, provide a readiness summary and let the user choose:
   - finalize with design package only
   - keep discussing

## Discussion-phase output

Prefer:

- a short restatement of the problem
- the most important design questions
- concrete solution directions when relevant
- clear trade-offs
- a recommendation when one path is strongest

Do not edit repository files unless the user explicitly switches from design to implementation.

## Finalization output

Return copy-ready Markdown with:

- Problem
- Why it matters
- Scope
- Out of scope
- Affected areas and likely files
- Validation and documentation impact
- Proposed implementation approach
- Open questions / resume here
- Recommended follow-on agent
