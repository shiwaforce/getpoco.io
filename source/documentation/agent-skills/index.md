---
title: Agent Skills
---

# Agent Skills

Use Poco with AI coding assistants (Cursor, Claude Code, OpenCode, and others) by installing **Agent Skills** so the assistant knows when and how to run poco — which commands to use, how poco.yml works, and how to follow your team’s conventions.

## What are Agent Skills?

Agent Skills are structured instructions (e.g. markdown files in a standard format) that agents load when your conversation matches the skill’s topic. The [Agent Skills](https://claude.com/blog/equipping-agents-for-the-real-world-with-agent-skills) format is supported by Cursor, Claude Code, and other tools.

## Poco Skills repo

**[shiwaforce/poco-skills](https://github.com/shiwaforce/poco-skills)** provides:

- **poco** skill — Commands (up, down, status, ps, config), Kubernetes (kubectx, kubens, kube-get, presets), Helm (helm-repos, helm-list), poco.yml, global options (-i, -V, -VV, -a), and workflows.
- **Shiwaforce conventions** (optional) — How Shiwaforce-style poco projects are structured (dc-*.yml, start scripts, proxy, logging, etc.) so the agent follows your practices.

## Install

### Cursor
**Settings → Rules → Add Rule → Remote Rule (GitHub)** and enter: `shiwaforce/poco-skills`.

### Other agents
Copy the contents of the [poco-skills](https://github.com/shiwaforce/poco-skills) `skills/poco/` folder into your agent’s skill directory (e.g. `~/.cursor/skills/poco/` for Cursor, or as documented by your tool).

### Project-specific skill
Run **`poco init --with-cursor-skill`** in a project to generate `.cursor/skills/poco-project/SKILL.md` so the assistant knows this project’s poco setup (config path, plan, suggested commands).

## Links

- [poco-skills on GitHub](https://github.com/shiwaforce/poco-skills)
- [Poco on GitHub](https://github.com/shiwaforce/poco)
