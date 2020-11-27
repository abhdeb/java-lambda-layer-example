#!/bin/bash
BUCKET_NAME=lambda-artifacts-$(head /dev/urandom | tr -dc a-z0-9 | head -c16)
echo $BUCKET_NAME > bucket-name.txt
aws s3 mb s3://$BUCKET_NAME