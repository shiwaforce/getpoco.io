---
title: Poco-izing
---

# Poco-izing

When we talk about "poco-izing" a project, we mean making the source code runnable using the poco tool. For example, we don’t want to install Node.js on the host machine, and we don’t want to type long docker compose commands.

First, we need a file named poco.yml in the root of the project. Here's an example:

```
version: "3.0"
maintainer: "poco@sarkiroka.hu"

before_script:
  - cd docker/scripts && chmod +x *

environment:
  include: docker/conf/default/conf.env

plan:
  js:
    description: "contains tools that make local development easier"
    docker-compose-file:
      - docker/dc-frontend.yml
      - docker/dc-proxy.yml
```

The version and maintainer fields are fixed. The before_script section can contain shell commands that need to be run before startup.

In the environment section, this is what we typically do. These are environment variables used to configure the docker compose files — not the insides of the containers. Typical use cases include setting ports or host machine folder paths. Here's an example:

conf.env

```
PROJECT_HOME=../
```

Finally, the poco.yml contains a block for plans. A plan defines a run mode. Typical values include "local", "js", "build", "demo", "java", etc.

Each plan contains a free-text description for humans under the description field, and a list of docker-compose files involved in that plan. In the example above, we have two: a proxy and a frontend. We use the proxy so that if there are multiple backends (maybe in different tech stacks), we can avoid CORS issues and expose everything under a common domain. We usually use nginx for this:


dc-proxy.yml

```
version: '3'

services:
  proxy:
    depends_on:
      - frontend
    links:
      - frontend
    image: nginx:alpine
    volumes:
      - ${PROJECT_HOME}/docker/conf/default/nginx.conf:/etc/nginx/nginx.conf:ro
    ports:
      - 80:80
    logging:
      options:
        max-size: "10k"
        max-file: "3"
```

We usually put the nginx config in docker/conf/default. Here's how it looks in this example:

nginx.conf

```
events {
  worker_connections  4096;  ## Default: 1024
}

http {

	include	   mime.types;
	default_type  application/octet-stream;

	sendfile		on;
	keepalive_timeout  65;

	server {
		listen		80;
		server_name localhost;

		charset utf-8;

		# location /api {
        #     proxy_pass http://bff:3000;
        #     proxy_http_version 1.1;
        #     proxy_set_header Upgrade $http_upgrade;
        #     proxy_set_header Connection "upgrade";
        # }

		location / {
			proxy_pass http://frontend:3000;
			proxy_http_version 1.1;
			proxy_set_header    Host                localhost;
			proxy_set_header X-Real-IP $remote_addr;
			proxy_set_header X-Forwarded-Proto $scheme;
			proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
			proxy_set_header Upgrade $http_upgrade;
			proxy_set_header Connection "upgrade";
		}

	}
}
```

So there's no static content served here — it's purely a proxy. One of the main benefits is that we don’t need to remember or expose random backend ports on the host machine. Everything runs on port 80 and is accessible at localhost.

The services don’t need their ports exposed, since everything is reachable internally. It’s enough to link them in dc-proxy.yml and define the correct dependency order.

Now let’s look at the dc-frontend.yml file used in this example:

```
version: '3'

services:
  frontend:
    image: node:22
    user: "${POCO_UID}:${POCO_GID}"
    restart: "no"  # Must be a string
    stop_signal: SIGKILL
    environment:
      UID: ${POCO_UID}
      GID: ${POCO_GID}
      HOST: ${HOST_SYSTEM}
    logging:
      options:
        max-size: "10k"
        max-file: "3"
    volumes:
      - ${PROJECT_HOME}/frontend:/usr/local/app/frontend
      - ${PROJECT_HOME}/docker:/usr/local/app/docker
    working_dir: /usr/local/app/frontend
    command: ../docker/scripts/start-dev.sh
```

We're using Node.js version 22 here. The user setting is important — the values are IDs provided by poco. The stop_signal helps ensure that a poco down js command shuts down the container immediately, not after a timeout.
You can inject environment variables into the container in the usual way. Logging settings are also important to prevent excessive log output.

When mapping volumes, we generally avoid mounting the entire project — only what's needed. But we make sure to preserve the folder structure under /usr/local/app. Finally, we usually start the app using a shell script so we can intervene more flexibly.

start-dev.sh

```
#!/bin/bash

cat ../docker/conf/ai-art.txt

npm install --no-fund --no-audit --no-update-notifier

npm run dev
```

This script launches the frontend dev server, and installs dependencies if needed. The ASCII art is an important part too — it visually separates fresh log lines from old ones.
