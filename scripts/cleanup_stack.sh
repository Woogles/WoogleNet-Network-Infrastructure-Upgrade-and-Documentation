#!/bin/bash
# WoogleNet Stack Cleanup Tool

if [ -z "$1" ]; then
    echo "Usage: ./cleanup_stack.sh <stack_name>"
    echo "Example: ./cleanup_stack.sh immich"
    exit 1
fi

STACK_NAME=$1

echo "Cleaning up stack: $STACK_NAME..."

# Attempt to bring down the stack and remove orphaned containers
docker compose -p $STACK_NAME down --remove-orphans

# Clean up unused networks created by the stack
docker network prune -f

echo "Stack $STACK_NAME has been removed. NAS data remains intact."
