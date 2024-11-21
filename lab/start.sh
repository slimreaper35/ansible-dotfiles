#!/bin/bash

set -e

podman compose down
podman compose up --build --detach

rm -f ~/.ssh/know_hosts.old

podman cp ~/.ssh/id_rsa.pub servera:/root/.ssh/authorized_keys
podman cp ~/.ssh/id_rsa.pub serverb:/root/.ssh/authorized_keys
