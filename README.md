# AWS CLI docker image

# What is aws-cli/awscli?

> aws-cli/awscli is the Amazon web services command line interface.

[Overview of aws-cli](https://docs.aws.amazon.com/cli/index.html)

# TL;DR;

```bash
docker run -ti --rm statful/aws-cli aws version
```

# Supported tags and respective `Dockerfile` links

The tags that match the following regex should be supported
* X.Y.Z
* X.Y

where `X`, `Y` and `Z` correspond to major minor and patch numbers following a semantic versioning approach.

Subscribe to project updates by watching the [statful/docker-aws-cli GitHub repo](https://github.com/statful/docker-aws-cli).

# Get this image

The recommended way to get the Statful aws-cli Docker Image is to pull the prebuilt image from the [Docker Hub Registry](https://hub.docker.com/r/statful/aws-cli).

```bash
docker pull statful/aws-cli:latest
```

To use a specific version, you can pull a versioned tag. You can view the [list of available versions](https://hub.docker.com/r/statful/aws-cli/tags/) in the Docker Hub Registry.

```bash
docker pull statful/aws-cli:[TAG]
```

If you wish, you can also build the image yourself.

```bash
# Building the latest image
docker build -t statful/aws-cli:latest 'https://github.com/statful/docker-aws-cli.git/tree/latest'

# Building a specific tag, e.g., 1.16
docker build -t statful/aws-cli:1.16 'https://github.com/statful/docker-aws-cli.git/tree/1.16'
```

# Configuration

## Running commands

To run commands inside this container you can use `docker run`, for example to execute `aws s3 ls` you can follow the example below:

```bash
docker run --rm --name aws-cli statful/aws-cli:latest -- aws s3 ls
```

Consult the [AWS CLI Reference Documentation](https://docs.aws.amazon.com/cli/index.html) to find the completed list of commands available.

## AWS Credentials

AWS credentials can either be passed by environment variables, or by mounting a volume with aws credentials file under `/root/.aws`.

### Environment variables

```bash
docker run -ti -e 'AWS_ACCESS_KEY_ID=********************' -e 'AWS_SECRET_ACCESS_KEY=****************************************' --rm statful/aws-cli aws s3 ls
```

```bash
# Using a credentials manager such as aws-vault or okta
aws-vault exec <PROFILE> -- docker run -ti -e 'AWS_ACCESS_KEY_ID=********************' -e 'AWS_SECRET_ACCESS_KEY=****************************************' --rm statful/aws-cli aws s3 ls
```

### AWS directory

```bash
docker run -ti -v '/Users/bearengineer/.aws:/root/.aws' --rm statful/aws-cli aws s3
```

### AWS credentials manager, e.g., aws-vault


# Contributing

We'd love for you to contribute to this container. You can request new features by creating an [issue](https://github.com/statful/docker-aws-cli/issues), or submit a [pull request](https://github.com/statful/docker-aws-cli/pulls) with your contribution.

# Issues

If you encountered a problem running this container, you can file an [issue](https://github.com/statful/docker-aws-cli/issues). For us to provide better support, be sure to include the following information in your issue:

- Host OS and version
- Docker version (`docker version`)
- Output of `docker info`
- Version of this container
- The command you used to run the container, and any relevant output you saw (masking any sensitive information)

# License

Copyright (c) 2019 Statful. All rights reserved.

This work is licensed under the terms of the MIT license.  
For a copy, see <https://opensource.org/licenses/MIT>.

