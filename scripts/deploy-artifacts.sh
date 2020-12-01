#!/bin/bash
ARTIFACT_BUCKET=$(cat bucket-name.txt)
TEMPLATE=template.yml
aws cloudformation package --template-file $TEMPLATE --s3-bucket $ARTIFACT_BUCKET --output-template-file out.yml
aws cloudformation deploy --template-file out.yml --stack-name java-lambda-layer-example --capabilities CAPABILITY_NAMED_IAM
