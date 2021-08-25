#!/bin/sh
./config.sh --url https://github.com/${GITHUB_OWNER} \
        --token ${GITHUB_TOKEN} \
        --work workspace \
        --unattended \
        --replace \
        --name ${GITHUB_RUNNER_NAME}
remove() {
    ./config.sh remove --unattended --token ${GITHUB_TOKEN}
}
trap 'remove; exit 130' INT
trap 'remove; exit 143' TERM
./run.sh "$*" &
wait $!
