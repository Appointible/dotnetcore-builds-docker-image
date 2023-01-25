# dotnetcore-builds-docker-image

This image is used in the [Gitlab](https://gitlab.com/) CI/CD service to build and deploy .NET Core applications to AWS Lambda.

The image is based on Alpine 3.16 and includes:
 - .Net Core SDK 6.0.403
 - Serverless Framework 3.26.0
 - Serverless Compose 1.3.0
   - https://www.npmjs.com/package/@serverless/compose
 - AWS CLI v2
