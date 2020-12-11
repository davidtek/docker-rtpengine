
FROM ubuntu:20.04

RUN apt-get update 
RUN apt-get install software-properties-common  --yes

RUN add-apt-repository ppa:davidlublink/rtpengine --yes

RUN apt-get update 
RUN apt-get install ngcp-rtpengine --yes

ENTRYPOINT ["/entrypoint.sh"]

CMD ["rtpengine"]


VOLUME ["/tmp"]

EXPOSE 23000-32768/udp 22222/udp

COPY ./entrypoint.sh /entrypoint.sh

COPY ./rtpengine.conf /etc

ENTRYPOINT ["/entrypoint.sh"]

CMD ["rtpengine"]
