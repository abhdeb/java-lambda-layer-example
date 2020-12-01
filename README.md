# java-lambda-layer-example
An example java lambda with layers and sam template

![Lambda Layer](https://d2908q01vomqb2.cloudfront.net/77de68daecd823babbb58edb1c8e14d7106e83bb/2018/12/21/Lambda-Layers-1-300x150.jpg)

# Requirements:

Java 8, Maven 3, AWS CLI 2 and Bash Shell

# Initial Setup and Execution:

Download or clone the repository. The project source includes function code and supporting resources:
- src/main - A Java function.
- src/test - Junit test classes.
- scripts - Contains an AWS CloudFormation template (template.yml) that creates an application and shell scripts that use the AWS CLI to deploy and manage the application.
- pom.xml - A Maven build file.

1. Configure AWS CLI with aws configure command to utilize the correct AWS account. 

2. Execute create-bucket.sh to create a S3 bucket with random name.
```sh
$ cd java-lambda-layer-example/scripts
$ ./create-bucket.sh
make_bucket: lambda-artifacts-c21iq3muy39e8yqx
```

3. Next, execute build-artifacts.sh, which will clean and package the project artifacts - target/java-lambda-layer-example-1.0.0.jar which consists of only the Lambda function code and target/java-lambda-layer-example-dependencies.zip which is the Lambda layer dependeincies zip file.
```sh
$ ./build-artifacts.sh
```

4. To deploy the Lambda function and it's layer, run deploy-artifacts.sh which utilizes sam-template.yml to create the resources.
```sh
$ ./deploy-artifacts.sh
```

5. At this point, the Lambda function is deployed and ready to be used. Run invoke-lambda.sh to trigger the Lambda function with a sample event json. It should result in 200 response status code.
```sh
$ ./invoke-lambda.sh

{
    "StatusCode": 200,
    "ExecutedVersion": "$LATEST"
}
"text/plain-abhdebgenerabucket-trigger/test_lambda_layer.txt"
```
![X-Ray](https://github.com/abhdeb/java-lambda-layer-example/blob/master/images/xray-view.jpg?raw=true)

6. Cleanup and delete the applion run cleanup-artifacts.sh

```sh
$ ./cleanup-artifacts.sh
```

