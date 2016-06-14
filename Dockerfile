FROM ubuntu
MAINTAINER Brian Antonelli

RUN apt-get update && apt-get install -y ca-certificates

ADD terraform.tar.gz /usr/bin/

RUN mkdir /work
VOLUME [ "/work" ]
WORKDIR "/work"

ENTRYPOINT ["/usr/bin/terraform"]
CMD ["version"]