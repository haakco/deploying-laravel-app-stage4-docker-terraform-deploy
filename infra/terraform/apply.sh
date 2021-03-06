#!/usr/bin/env bash
export DOMAIN_NAME=example.com

if [[ -z ${CLOUDFLARE_API_TOKEN} ]]; then
  echo "Please enter the CLOUDFLARE_API_TOKEN or set the env variable: "
  read -r CLOUDFLARE_API_TOKEN
else
  echo "Read CLOUDFLARE_API_TOKEN from env"
fi
export CLOUDFLARE_API_TOKEN

export TF_VAR_cloudflare_api_token="${CLOUDFLARE_API_TOKEN}"

if [[ -z ${DIGITALOCEAN_TOKEN} ]]; then
  echo "Please enter the DIGITALOCEAN_TOKEN or set the env variable: "
  read -r DIGITALOCEAN_TOKEN
else
  echo "Read DIGITALOCEAN_TOKEN from env"
fi
export DIGITALOCEAN_TOKEN

export TF_VAR_do_token="${DIGITALOCEAN_TOKEN}"

export TF_VAR_dns_domain="${DOMAIN_NAME}"

terraform apply -refresh=true -parallelism=10
