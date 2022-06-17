FROM summerwind/actions-runner:latest
RUN sudo  apt-get update \
    && sudo  apt-get install -y \
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
    && sudo  apt-get clean \
    && sudo  rm -rf /var/lib/apt/lists/*

WORKDIR /home/semits/repository/external
RUN curl -o boost_1_73_0.tar.gz  -L https://boostorg.jfrog.io/artifactory/main/release/1.73.0/source/boost_1_73_0.tar.gz
RUN tar xzf ./boost_1_73_0.tar.gz
RUN rm -rf ./boost_1_73_0.tar.gz

WORKDIR /home/semits/

RUN sudo usermod -aG docker runner 

CMD ["entrypoint.sh"]
