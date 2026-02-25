---
title: Configuration
---

# Configuration

Poco projects are configured via **poco.yml** in the project root (or the path set in the catalog). The file uses YAML; supported schema version is **2.0**.

## Main keys

| Key | Description |
|-----|-------------|
| **version** | Schema version, e.g. `'2.0'` |
| **maintainer** | Optional contact (e.g. email) |
| **containers** | Optional map of names to compose files (e.g. `sample: dc-sample.yml`) |
| **environment** | Optional global env; use **include** for env files |
| **plan** | **Required.** Map of plan name to config (docker-compose-file, environment, before_script, etc.) |
| **before_script** | Optional. Scripts run inside a container before the plan (see Schema). |
| **before_docker_script** | Optional. Commands run on the **host** before Docker, per OS. See below. |

## Plans

Each plan has a **docker-compose-file** (list of compose files or container names from **containers**), and optionally **environment.include** (env files for that plan). Example:

```yaml
version: '2.0'
maintainer: "ops@example.com"

plan:
  default:
    environment:
      include: docker/conf/default.env
    docker-compose-file:
      - docker/dc-app.yml
      - docker/dc-proxy.yml
  dev:
    environment:
      include: docker/conf/dev.env
    docker-compose-file:
      - docker/dc-app.yml
      - docker/dc-db.yml
      - docker/dc-proxy.yml
```

## before_docker_script (1.0)

Optional **before_docker_script** runs on the **host** (not in Docker), **before** the usual Docker flow. Use it for steps that must run on the machine (e.g. create directories, set permissions) before containers start. Keys are **linux**, **darwin**, **windows**; each value is a list of shell commands for that OS.

```yaml
before_docker_script:
  linux:
    - "mkdir -p ./data"
    - "chmod +x ./scripts/*.sh"
  darwin:
    - "mkdir -p ./data"
  windows:
    - "if not exist .\\data mkdir .\\data"
```

If the current OS has no key, nothing is run. Only used when Poco runs in Docker (Compose) mode.

## See also

- [Schema](/documentation/schema) — Full poco.yml syntax (before_script, checkout, etc.).
