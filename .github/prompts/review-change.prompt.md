# Review a larspizza website change

> Invoke with `@.github/prompts/review-change.prompt.md`. Delegates to the `reviewer` agent.

Review a website change set with emphasis on correctness, accessibility, maintainability, and user-facing quality.

## Required process

1. Start with the highest-risk user-facing area in the diff.
2. Check changed HTML for semantic structure, headings, forms, landmarks, links, and image text alternatives.
3. Check changed CSS for duplication, brittle selectors, layout risks, and avoidable complexity.
4. Check changed JavaScript for unnecessary coupling, fragile selectors, and interactions that may break without clear fallback behavior.
5. Check whether page copy, contact details, calls to action, and other content still match the implemented behavior.
6. Note any missing validation or follow-up work.

## Output

Structure the review as:

1. A short risk summary naming the highest-risk area
2. A numbered list of findings with file and line range, the issue, and the required fix
3. A final pass or needs-changes verdict
