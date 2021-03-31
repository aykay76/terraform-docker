#!/usr/bin/dumb-init /bin/sh
set -e

mkdir /src
cd /src
git clone https://github.com/aykay76/terraform.git

cd terraform

terraform init

terraform plan

terraform apply
