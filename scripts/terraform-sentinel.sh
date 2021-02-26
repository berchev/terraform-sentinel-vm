#!/usr/bin/env bash

#Debug mode enabled 
#set -x


# Install specific Terraform version. Desired Version -> format x.y.z
TERRAFORM_VERSION="0.12.29"

[ -f "/usr/local/bin/terraform" ] || {
  pushd /usr/local/bin
  TERRAFORM_URL=$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].url' | egrep 'terraform_[0-9]\.[0-9]{1,2}\.[0-9]{1,2}_linux.*amd64' | sort -V | grep ${TERRAFORM_VERSION})
  curl -o terraform.zip ${TERRAFORM_URL}
  unzip terraform.zip
  rm -f terraform.zip
  popd
}

# Install specific Sentiel version. Desired Version -> format x.y.z
SENTINEL_VERSION="0.17.4"

[ -f "/usr/local/bin/sentinel" ] || {
  pushd /usr/local/bin
  SENTINEL_URL=$(curl -sL https://releases.hashicorp.com/sentinel/index.json | jq -r '.versions[].builds[].url' | egrep 'sentinel_[0-9]\.[0-9]{1,2}\.[0-9]{1,2}_linux.*amd64' | sort -V | grep ${SENTINEL_VERSION})
  curl -o sentinel.zip ${SENTINEL_URL}
  unzip sentinel.zip
  rm -f sentinel.zip
  popd
}
