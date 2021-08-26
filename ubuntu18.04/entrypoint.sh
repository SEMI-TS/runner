#!/bin/sh
REG_TOKEN=$(curl -sX POST -H "Accept: application/vnd.github.v3+json" \
                -H "Authorization: token ${GITHUB_TOKEN}" \
https://api.github.com/orgs/${GITHUB_OWNER}/actions/runners/registration-token | jq .token --raw-output)

./config.sh --url https://github.com/${GITHUB_OWNER} \
        --token ${REG_TOKEN} \
        --work workspace \
        --unattended \
        --replace
        
remove() {
    ./config.sh remove --unattended --token ${REG_TOKEN}
}
trap 'remove; exit 130' INT
trap 'remove; exit 143' TERM
./run.sh "$*" &
wait $
