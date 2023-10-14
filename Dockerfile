FROM ubuntu:22.04


LABEL maintainer="rolchrissa@gmail.com"
LABEL version="0.1"
LABEL description="Image to create a New Relic Lambda configuration"


RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3 python3-pip curl unzip && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf awscliv2.zip ./aws

RUN pip3 install --upgrade newrelic-lambda-cli

WORKDIR /app

COPY ./script.sh /app/

RUN chmod +x /app/script.sh

CMD ["/app/script.sh"]