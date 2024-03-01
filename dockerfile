FROM google/cloud-sdk:latest

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y bash
RUN apt-get install -y bash-completion
#RUN apk add --no-cache --update bash bash-completion docker-bash-completion openssh curl

# Install Terraform and AWS CLI
RUN wget -O terraform.zip 'https://releases.hashicorp.com/terraform/1.3.9/terraform_1.3.9_linux_arm64.zip' \
    && unzip terraform.zip \
    && rm terraform.zip \
    && mv ./terraform /usr/bin/ \
    && pip3 install awscli --upgrade

WORKDIR /usr/src/gcpgoat/
COPY ./ ./
#RUN gcloud auth application-default login
#RUN  terraform init
#RUN terraform apply --auto-approve
#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
