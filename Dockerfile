# Cloud testing environment
FROM amazon/aws-cli:latest

# Set mock credentials for local services
ENV AWS_ACCESS_KEY_ID mock-key
ENV AWS_SECRET_ACCESS_KEY mock-secret

# Upgrade node and install python3
RUN curl https://rpm.nodesource.com/setup_12.x | bash -
RUN yum -y install nodejs python3 unzip
RUN rm /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip

# Install terraform and awscli-local
RUN pip install awscli-local
RUN curl -o tf.zip https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip && unzip tf.zip && mv terraform /usr/local/bin && rm tf.zip

ENTRYPOINT /bin/bash
