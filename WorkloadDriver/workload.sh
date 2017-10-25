#!/bin/bash

./wait-for-it.sh -t 30 swiftmetrics:8080
./wrk2/wrk -t2 -c100 -d30m -R20 http://swiftmetrics:8080/json &
./wait-for-it.sh -t 30 appmetrics:3000
./wrk2/wrk -t2 -c100 -d30m -R200 http://appmetrics:3000/ &
./wait-for-it.sh -t 60 javametrics:9080
./wrk2/wrk -t2 -c100 -d30m -R20 http://javametrics:9080/JavaSampleProject/json
