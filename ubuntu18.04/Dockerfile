FROM ubuntu:18.04
ENV RUNNER_ALLOW_RUNASROOT="1"
ENV GITHUB_TOKEN ""
ENV GITHUB_OWNER ""
ENV GITHUB_RUNNER_NAME ""

RUN apt-get update \
    && apt-get install -y \
        curl \
        sudo \
        git \
        jq \
        tar \
        gnupg2 \
        apt-transport-https \
        ca-certificates  \
        make \
        g++ \
        apt-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/semits

COPY entrypoint.sh ./entrypoint.sh
RUN chmod u+x ./entrypoint.sh

RUN curl -o actions-runner-linux-x64-2.279.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.279.0/actions-runner-linux-x64-2.279.0.tar.gz
RUN echo "50d21db4831afe4998332113b9facc3a31188f2d0c7ed258abf6a0b67674413a  actions-runner-linux-x64-2.279.0.tar.gz" | shasum -a 256 -c
RUN tar xzf ./actions-runner-linux-x64-2.279.0.tar.gz

RUN sudo ./bin/installdependencies.sh

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/semits/repository/external
RUN curl -o boost_1_73_0.tar.gz  -L https://boostorg.jfrog.io/artifactory/main/release/1.73.0/source/boost_1_73_0.tar.gz
RUN tar xzf ./boost_1_73_0.tar.gz
WORKDIR /home/semits/

ENTRYPOINT ["./entrypoint.sh"]