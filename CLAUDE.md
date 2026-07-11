@AGENTS.md

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

> **For all design system rules, component patterns, coding conventions, and UI/UX constraints, see [AGENTS.md](./AGENTS.md).** AGENTS.md is the single source of truth for the codebase.

## Claude-Specific Guidelines

### Verification & Quality Assurance
- **Verification Command**: Before completing a task, you must run the build command (`npm run build`) to ensure there are no compilation or typescript errors.
- **Linting**: Run `npm run lint` to verify that linting passes cleanly before finishing.

### Subagents & Permissions
- **Delegation**: Use the `research` subagent when you need to perform broad searches or codebase surveys.
- **Permissions**: Request the narrowest scope possible when asking for file read/write permissions.

### Graphify Integration
- **Graph Queries**: If `graphify-out/graph.json` exists, prefer `graphify query "<question>"` or `graphify explain "<concept>"` to fetch contextual subgraphs instead of doing broad grep searches.
- **Graph Updates**: After modifying any code, run `graphify update .` to keep the codebase AST graph in sync.
