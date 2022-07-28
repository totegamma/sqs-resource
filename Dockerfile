FROM ubuntu:focal

RUN apt update \
 && apt upgrade -y \
 && apt install -y --no-install-recommends \
    ca-certificates python3 python3-boto3

ADD src/ /opt/resource

RUN chmod u+x /opt/resource/check
RUN chmod u+x /opt/resource/in
RUN chmod u+x /opt/resource/out


