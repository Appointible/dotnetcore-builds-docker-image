# dotnetcore-builds-docker-image

This image is used in the [Gitlab](https://gitlab.com/) CI/CD service to build and deploy .NET Core applications to AWS Lambda.

The image is based on Alpine 3.14 and includes:
 - .Net Core SDK 3.1.414
 - Serverless Framework 2.64.1
 - AWS CLI v2