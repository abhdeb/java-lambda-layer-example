#!/bin/bash
FUNCTION=$(aws cloudformation describe-stack-resource --stack-name java-lambda-layer-example --logical-resource-id function --query 'StackResourceDetail.PhysicalResourceId' --output text)

aws lambda invoke --function-name $FUNCTION --payload file://s3-event.put.json out.json
cat out.json
echo ""

