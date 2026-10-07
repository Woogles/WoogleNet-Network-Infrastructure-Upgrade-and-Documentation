#!/usr/bin/env bash

set -Eeuo pipefail

usage() {
    cat >&2 <<'EOF'
Usage: compose-stack.sh <validate|up|down|ps|logs> <stack-directory> [service...]

The stack directory must contain compose.yaml (or docker-compose.yml).
Examples:
  ./scripts/compose-stack.sh validate stacks/foundation
  ./scripts/compose-stack.sh up stacks/foundation
  ./scripts/compose-stack.sh logs stacks/foundation adguard

"down" stops/removes containers and networks but keeps named volumes.
EOF
}

if [[ $# -lt 2 ]]; then
    usage
    exit 2
fi

action=$1
stack_dir=$2
shift 2

if [[ ! -d "$stack_dir" ]]; then
    echo "Stack directory not found: $stack_dir" >&2
    exit 2
fi

stack_dir=$(cd "$stack_dir" && pwd)
compose_file="$stack_dir/compose.yaml"
if [[ ! -f "$compose_file" ]]; then
    compose_file="$stack_dir/docker-compose.yml"
fi
if [[ ! -f "$compose_file" ]]; then
    echo "No compose.yaml or docker-compose.yml found in $stack_dir" >&2
    exit 2
fi

if ! docker compose version >/dev/null 2>&1; then
    echo "Docker Compose v2 is required and must be available to this user." >&2
    exit 1
fi

compose=(docker compose --project-directory "$stack_dir" --file "$compose_file")
if [[ -f "$stack_dir/.env" ]]; then
    compose+=(--env-file "$stack_dir/.env")
fi

case "$action" in
    validate)
        "${compose[@]}" config --quiet
        echo "Compose configuration is valid: $stack_dir"
        ;;
    up)
        "${compose[@]}" config --quiet
        "${compose[@]}" up -d --remove-orphans
        "${compose[@]}" ps
        ;;
    down)
        "${compose[@]}" down
        ;;
    ps)
        "${compose[@]}" ps
        ;;
    logs)
        "${compose[@]}" logs --tail 100 --follow "$@"
        ;;
    *)
        usage
        exit 2
        ;;
esac