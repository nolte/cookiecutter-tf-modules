#!/usr/bin/env bash
#
# This can be also run with ``
# ./generate_project.sh "tf-k8s-awx" "$(pwd)"

set -e
set -o pipefail
set -o nounset

echo "==> Starting Generating Project..."

PROJECT_NAME=$1
PROJECT_BASE=$2
STARTING_DIR=$(pwd)

cd "${PROJECT_BASE}"

echo "Generate ${PROJECT_NAME} to ${PROJECT_BASE}"

cookiecutter gh:nolte/vscode-devcontainers --directory="cookiecutter-project" project_slug="${PROJECT_NAME}" project_type="devops" extra_dockerfile="n" -f --no-input 
cookiecutter gh:nolte/cookiecutter-tf-modules --directory="tf-boostrap" project_slug="${PROJECT_NAME}" --checkout feature/tf-helm-modules -f --no-input
cookiecutter gh:nolte/cookiecutter-tf-modules --directory="tf-boostrap-test" project_slug="${PROJECT_NAME}" --checkout feature/tf-helm-modules -f --no-input
cd ./${PROJECT_NAME}/modules
cookiecutter gh:nolte/cookiecutter-tf-modules --directory="tf-helm-module" --checkout feature/tf-helm-modules -f --no-input
 
cd $STARTING_DIR

echo "$"