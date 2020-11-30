#!/bin/bash
STACK=java-lambda-layer-example
FUNCTION=$(aws cloudformation describe-stack-resource --stack-name $STACK --logical-resource-id function --query 'StackResourceDetail.PhysicalResourceId' --output text)

rm -f out.yml out.json
echo "Deleted tmp deployment files."

# Delete CF Stack
aws cloudformation delete-stack --stack-name $STACK
echo "Deleted $STACK stack."

# Delete S3 Bucket
ARTIFACT_BUCKET=$(cat bucket-name.txt)
aws s3 rb --force s3://$ARTIFACT_BUCKET
rm bucket-name.txt
echo "Deleted $ARTIFACT_BUCKET bucket."

# Delete CW Log Group
MSYS_NO_PATHCONV=1 aws logs delete-log-group --log-group-name /aws/lambda/$FUNCTION
echo "Deleted /aws/lambda/$FUNCTION cloudwatch log group."

