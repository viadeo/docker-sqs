# build:  docker build -t viadeo/docker-sqs .
# run:    docker run --rm -v "$(pwd)/config:/elasticmq/config:ro" -p 9324:9324 viadeo/docker-sqs
# test: cd tests && ./run.sh

FROM quay.io/viadeo/docker-java

EXPOSE 9324

RUN apt-get update && apt-get install -y curl

RUN mkdir /elasticmq && \
    cd /elasticmq && \
    curl -sS -o \
        /elasticmq/elasticmq-server-0.9.3.jar \
        https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-0.9.3.jar
ADD run.sh /
ADD my_logback.xml /elasticmq/

CMD ["/run.sh"]
