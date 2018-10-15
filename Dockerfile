FROM ubuntu:latest

RUN mkdir /root/tools
WORKDIR /root/tools

RUN wget https://releases.hashicorp.com/packer/1.3.1/packer_1.3.1_linux_amd64.zip
RUN wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip

RUN apt-get -qq update && apt-get install --no-install-recommends -qqy \
    curl \
    ca-certificates \
    git \
    unzip

RUN unzip packer_1.3.1_linux_amd64.zip
RUN unzip terraform_0.11.8_linux_amd64.zip

RUN mv packer /bin/packer
RUN mv terraform /bin/terraform

RUN rm packer_1.3.1_linux_amd64.zip
RUN rm terraform_0.11.8_linux_amd64.zip
