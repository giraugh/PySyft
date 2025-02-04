#!/bin/bash
mkdir .docker-cache || true
mkdir .docker-cache/openmined || true
docker image ls --format="{{.ID}} {{.Repository}}:{{.Tag}}" --filter=dangling=false --filter=reference='openmined/*' | awk '{ print $2 }' | cut -d ":" -f 1 | xargs -L 1 -I {} docker save -o .docker-cache/{}.tar {}
