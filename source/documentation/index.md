---
title: Overview
---

# Overview
Poco is one CLI for **Docker**, **Kubernetes**, and **Helm**: organise and run Compose projects from a catalog, switch kubectl context and namespace, list Helm repos and releases — without leaving your terminal.

- **Simple.** Configure, run and switch between projects with a very simple command line interface.
- **Flexibility.** Manage, scale, maintain projects of any complexity with ease.
- **Configure Once, Use Everywhere.** Configure project once so the rest of your team will feel the value of zero configuration.

### Features (1.0)
- **Docker Compose** — `poco up`, `poco down`, `poco ps`, `poco status` (overview of running projects from any directory), `poco config`, build, pull. Matrix-style effect for up/down; use `-VV` or `--no-matrix` for full log.
- **Kubernetes** — `poco kubectx`, `poco kubens` (list/switch context and namespace), `poco kube-get pods|ns|svc|...`, **presets** (save/switch context + namespace in one command: `poco preset list|use|save`).
- **Helm** — `poco helm-repos`, `poco helm-list` (releases; `-i` to pick interactively).
- **Interactive menu** — `poco -i` for a step-by-step menu (start/stop, K8s, Helm, catalog).
- **Global options** — `-V` (verbose), `-VV` / `--no-matrix`, `-a` (with status: include stopped projects).
- Git, SVN support. Project catalog, multiple catalogs, multiple plans. Script support (before_script, **before_docker_script** for host-side commands per OS: windows, darwin, linux).

### Poco Project
A Poco project is a git/svn project with a **poco.yml** file (and at least one docker-compose file). Example:
```yaml
version: '2.0'
maintainer: 'operations@example.com'

environment:
  include: docker/conf.env

plan:
  default:
    docker-compose-file:
      - docker/dc-nginx.yml
      - docker/dc-app.yml
  demo:
    docker-compose-file:
      - docker/dc-nginx.yml
      - docker/dc-mysql-demo.yml
```
See [Configuration](/documentation/configuration) and [Schema](/documentation/schema) for **before_docker_script**, **containers**, and full options.

### Poco Plan
With Poco plans you can configure multiple environments (development, production, demo, etc.) in your project
keeping configuration small, easily scalable, maintainable and reusable. 
  
#### Use Cases:
- useful for large scalable projects or with projects with big number of micro services.
- configure plans (environments) for different groups of developers, so they will be able to run only required services/containers keeping low usage of working machine resources.
- configure plans for demo purposes with predefined content, so anyone on your team can demonstrate any project to the client with ease.


### Poco Repo
Poco Repo is a catalog source (a Git repo with a `poco-catalog.yml` file). Use `poco repo add`, `poco repo ls`, `poco repo pull`, `poco repo push` to manage repos. Example catalog entry:
```yaml
my-project-1:
  file: poco.yml
  git: ssh://git@git-server.com/my-project-1
my-project-2:
  file: poco.yml
  git: ssh://git@git-server.com/my-project-2
```

### Poco Catalog
The catalog lists available projects (from poco-catalog.yml in each repo). Add repos with `poco repo add`; the catalog must contain a `poco-catalog.yml` with project definitions. Use `poco project add`, `poco project ls`, `poco catalog` to work with projects. Run `poco -?` or `poco help <command>` for up-to-date usage.

### Agent Skills (AI assistants)
Use Poco with Cursor, Claude Code, or other agents: install [Agent Skills](https://github.com/shiwaforce/poco-skills) so the assistant knows when and how to run poco. See [Agent Skills](/documentation/agent-skills).
