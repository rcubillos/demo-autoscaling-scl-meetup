#!/bin/bash
aws s3 cp s3://demo.awschileug/waitMessages.jar /root/waitMessages.jar
aws s3 cp s3://demo.awschileug/log-config.properties /root/log-config.properties
nohup java -Djava.util.logging.config.file=/root/log-config.properties  -jar /root/waitMessages.jar -queue DEMO_INPUT > salida.out 2> error.out < /dev/null &
curl https://s3.amazonaws.com//aws-cloudwatch/downloads/latest/awslogs-agent-setup.py -O
chmod +x ./awslogs-agent-setup.py
./awslogs-agent-setup.py -n -r us-east-1 -c s3://demo.awschileug/cwagent.conf
