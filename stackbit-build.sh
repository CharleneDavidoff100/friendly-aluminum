#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e828e83889cc0001b1c339c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e828e83889cc0001b1c339c
curl -s -X POST https://api.stackbit.com/project/5e828e83889cc0001b1c339c/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e828e83889cc0001b1c339c/webhook/build/publish > /dev/null
