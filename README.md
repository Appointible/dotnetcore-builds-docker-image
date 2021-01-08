# dotnetcore-builds-docker-image

This image is used in the [Gitlab](https://gitlab.com/) CI/CD service to build and deploy .NET Core applications to AWS Lambda.

The image is based on Alpine 3.12 and includes:
 - .Net Core SDK 3.1.404
 - Serverless Framework 2.18
 - AWS CLI v2