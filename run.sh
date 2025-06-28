#!/bin/sh

[ "$#" -ne 2 ] && echo "Usage: $0 <environment> <action>" && exit 1

ENV_NAME=$1
ACTION=$2
export ENV_NAME

DIST_FILE="$PWD/environment/${ENV_NAME}/.env.${ENV_NAME}.dist"
PROJECT_NAME="${ENV_NAME}_squid_game"

echo "Running with ENV_NAME=${ENV_NAME} and ACTION=${ACTION}"

git fetch origin main
git switch main
git pull origin main

docker compose --env-file "$DIST_FILE" --project-name "$PROJECT_NAME" pull
docker compose --env-file "$DIST_FILE" --project-name "$PROJECT_NAME" up --force-recreate --remove-orphans --build --detach
docker compose \
  --env-file "$DIST_FILE" \
  --project-name "$PROJECT_NAME" \
  exec -T caddy caddy reload --config /etc/caddy/Caddyfile
  
docker image prune --force