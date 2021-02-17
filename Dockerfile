# Cloud testing environment
FROM amazon/aws-cli:latest

ENV POWERSHELL_MAJOR_VERSION="7.1.2" \
  POWERSHELL_MINOR_VERSION="-1" \
  TERRAFORM_VERSION="0.14.6"

# Install PowerShell
RUN yum install -y https://github.com/PowerShell/PowerShell/releases/download/v${POWERSHELL_VERSION}/powershell-${POWERSHELL_MAJOR_VERSION}${POWERSHELL_MINOR_VERSION}.rhel.7.x86_64.rpm

# Upgrade node and install python3
RUN curl https://rpm.nodesource.com/setup_12.x | bash -
RUN yum -y install nodejs python3 unzip wget

RUN update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1 \
  && ls -la /etc/alternatives/pip | grep pip3 \
  && update-alternatives --install /usr/bin/python python /usr/bin/python3 1 \
  && ls -la /etc/alternatives/python | grep python3

# Install Terraform and awscli-local
RUN pip install awscli-local
RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip terraform.zip \
  && mv terraform /usr/local/bin \
  && rm terraform.zip

ENTRYPOINT /bin/bash
