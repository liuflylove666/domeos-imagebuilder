#FROM pub.domeos.org/domeos/build:0.5 
FROM docker:1.12.6 

RUN apk add --no-cache git openssh-client

COPY dockerize /code/dockerize
COPY dockerize /usr/local/bin/dockerize
COPY imagebuilder /usr/local/bin/build
ENTRYPOINT  ["/usr/local/bin/build"]

