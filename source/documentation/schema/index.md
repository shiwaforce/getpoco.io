---
title: Syntax for poco yaml
---

# Syntax for poco yaml

## About YAML syntax for poco

poco files use YAML syntax, and must have either a .yml or .yaml file extension. If you're new to YAML and want to learn more, see "[Learn YAML in Y minutes](https://learnxinyminutes.com/docs/yaml/)".

You must store poco files in the root directory of your repository.

## POCO plans configuration file

| Field                              | Description                             |
| ---------------------------------- | --------------------------------------- |
| version                            | Minimum API version of poco yaml schema |
| maintener                          | Owner of the project                    |
| [environment](#environment-object) | Global environment variable             |
| [plan](#plans-object)              | The plan configurations                 |
| [checkout](#checkout-object)       | Other Git repositories of the project   |
| [before_script](#script-object)    | Run script before start the plan        |
| [after_script](#script-object)     | Run script after start the plan         |

```yaml
version: 0.99
maintener: operation@shiwaforce.com
environment:
  # see details in Environment object
checkout:
  # see details in Checkout object
before_script:
  # see details in Script object
after_script:
  # see details in Script object
plan:
  # see details in Plans object
```

## Environment object

| Field   | Description         |
| ------- | ------------------- |
| include | Path of `.env` file |

```yaml
environment:
  include: .poco/global/default.env
```

## Checkout object

List of other Git repositories for the project

| Arguments  | Description                                    |
| ---------- | ---------------------------------------------- |
| folder     | Target place of the repository                 |
| git url    | Clonable url of the repository (ssh preferred) |
| branch     | Branch name is optional (default: master)      |

```yaml
checkout:
  - .poco/git/another-component git@github.com:shiwaforce/poco.git "feature/custom-branch"
```

## Script object

| Field   | Description                              |
| --------| ---------------------------------------- |
| image   | Name of the custom plan (dynamic object) |
| command | List of command                          |

```yaml
before_script:
  image: custom-data-image:latest
  command:
    - mkdir -p .poco/custom-temp-folder
    - cp -r /data-in-container .poco/custom-temp-folder
```

## Plans object

| Field                        | Description                              |
| ---------------------------- | ---------------------------------------- |
| [&lt;name&gt;](#plan-object) | Name of the custom plan (dynamic object) |

```yaml
plan:
  my-custom-plan-name:
    # See details in Plan object
```

## Plan object

### Optional plan atributes

| Field                              | Description                                |
| ---------------------------------- | ------------------------------------------ |
| description                        | Short sentence about the aim of the plan   |
| [environment](#environment-object) | Custom environment variable for the plan   |
| [before_script](#script-object)    | Run script before start the plan           |
| [after_script](#script-object)     | Run script after start the plan            |
| [checkout](#checkout-object)       | Other Git repositories of the project      |

### Plan resource attribute

only one type of runner can be used in plan

| Field                              | Description                             |
| ---------------------------------- | --------------------------------------- |
| docker-compose-file                | List of docker compose files            |
| script                             | List of command                         |
| kubernetes-file                    | List of Kubernetes resources            |
| kubernetes-dir                     | List of Kubernetes resourves directory  |
| helm-file                          | List of Helm chart file                 |
| helm-dir                           | List of Helm chart directory            |

```yaml
plan:

  ## Docker compose plan
  my-custom-plan-name:
    description: "This is the sample description"
    environment:
      include: .poco/global/my-custom-plan.env
    docker-compose-file:
      - .poco/nginx.yaml
      - .poco/nodejs.yaml

  ## Script plan
  my-script-plan:
    description "Custom cleanup plan"
    script:
      - rm -rf .poco/custom-temp-folder
```


