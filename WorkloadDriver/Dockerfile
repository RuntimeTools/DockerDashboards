FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y libssl-dev
RUN apt-get install -y build-essential

COPY . .

RUN cd wrk2 && make

CMD ["sh", "workload.sh"]
