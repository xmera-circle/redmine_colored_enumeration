#!/usr/bin/env bash

GIT_DIR=$(git rev-parse --git-dir)

echo "Uninstalling hooks..."
# this command creates symlink to our pre-commit script
rm $GIT_DIR/hooks/pre-commit
rm $GIT_DIR/hooks/pre-push
echo "Done!"
