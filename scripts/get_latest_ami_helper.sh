#!/bin/bash -e

# This script retrieves the latest official Canonical Ubuntu image from 
# the AWS EC2 library. It assumes that `awsenv` variables have been set.
# It is copied almost verbatim from https://github.com/mitchellh/packer/issues/2756

REGION=us-east-1

aws ec2 describe-images \
    --region $REGION \
    --filter Name=owner-id,Values=099720109477 \
    --query 'Images[? starts_with(ImageLocation, `099720109477/ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server`)] | sort_by(@, & ImageLocation) | [-1] | ImageId'  --out text
