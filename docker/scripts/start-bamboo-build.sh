#!/bin/bash

docker run --rm -v $(pwd):/usr/local/app --name hexobuild -w /usr/local/app node:20 /bin/sh -c "/usr/local/app/docker/scripts/start-build.sh" && docker logs hexobuild -f
