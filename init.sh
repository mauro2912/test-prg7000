#!/bin/bash

set -e

sudo exec > >(tee /var/log/user-data.log | logger -t user-data-extra -s 2>/dev/console) 2>&1

sudo apt update -y

sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
sudo rpm -ivh ./amazon-cloudwatch-agent.rpm

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
	-a fetch-config \
	-m ec2 \
	-c ssm:${ssm_cloudwatch_config} -s
