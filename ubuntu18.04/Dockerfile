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
        gnupg  \
        apt-transport-https \
        ca-certificates  \
        make \
        g++ \
        apt-utils \
        lsb-release \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/semits

COPY entrypoint.sh ./entrypoint.sh
RUN chmod u+x ./entrypoint.sh

RUN curl -o actions-runner-linux-x64-2.280.3.tar.gz -L https://github.com/actions/runner/releases/download/v2.280.3/actions-runner-linux-x64-2.280.3.tar.gz
RUN echo "69dc323312e3c5547ba1e1cc46c127e2ca8ee7d7037e17ee6965ef6dac3c142b  actions-runner-linux-x64-2.280.3.tar.gz" | shasum -a 256 -c
RUN tar xzf ./actions-runner-linux-x64-2.280.3.tar.gz

RUN sudo ./bin/installdependencies.sh

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update
RUN apt-get install -y systemd
RUN apt-get install -y docker-ce docker-ce-cli containerd.io

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY daemon.json /etc/docker/

WORKDIR /home/semits/repository/external
RUN curl -o boost_1_73_0.tar.gz  -L https://boostorg.jfrog.io/artifactory/main/release/1.73.0/source/boost_1_73_0.tar.gz
RUN tar xzf ./boost_1_73_0.tar.gz
WORKDIR /home/semits/

ENTRYPOINT ["./entrypoint.sh"]
