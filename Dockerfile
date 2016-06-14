FROM ubuntu
MAINTAINER Brian Antonelli

RUN apt-get update && apt-get install -y ca-certificates

# Need to split up since GH wont take files over 100MB
ADD terraform1.tar.gz /usr/bin/
ADD terraform2.tar.gz /usr/bin/

RUN mkdir /work
VOLUME [ "/work" ]
WORKDIR "/work"

ENTRYPOINT ["/usr/bin/terraform"]
CMD ["version"]