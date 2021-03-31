FROM golang:alpine as builder

LABEL maintainer="Alan Kelly <alan.kelly.london@gmail.com>"

ENV TERRAFORM_VERSION=0.10.0

RUN apk add --update git bash openssh

ENV TF_DEV=true
ENV TF_RELEASE=true

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh

######## Start a new stage from scratch #######
FROM mcr.microsoft.com/azure-cli

RUN apk --no-cache add ca-certificates

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /go/bin/terraform /usr/local/bin

# Command to run the executable
CMD ["terraform"] 

