#!/bin/sh

# This script sets up Alpine for development

# shadow: provides useradd groupadd \
# su-exec: switch user and exec, see https://github.com/ncopa/su-exec \
apk update
apk --no-cache add \
    bash \
    shadow \
    su-exec
