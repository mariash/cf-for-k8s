#!/bin/bash

commit-long-lived-sli-cf-vars() {

    cp -r relint-envs/. relint-envs-updated
    mkdir -p relint-envs-updated/k8s-environments/long-lived-sli
    cp "/tmp/${DNS_DOMAIN}/cf-vars.yaml" relint-envs-updated/k8s-environments/long-lived-sli/cf-vars.yaml

    pushd relint-envs-updated > /dev/null
    git config user.email "cf-release-integration@pivotal.io"
    git config user.name "relint-ci"
    git add .
    git commit -m "Update long-lived environment"
    popd > /dev/null
}