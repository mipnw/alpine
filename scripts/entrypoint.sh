#!/bin/bash

# This script is the docker entrypoint

if [ -z $ROOT ]
then
    # Create a user and group whose UID an GID match the calling user on the docker host.
    #
    # This helps when you mount volumes on the host, so the files created by 
    # the container aren't owned by root, or by some user created in the Dockerfile
    # whose UID doesn't exist on the docker host.
    #
    USER_ID=${LOCAL_USER_ID:-9001}
    GROUP_ID=${LOCAL_GROUP_ID:-9002}
    echo "Starting with user $USER_ID:$GROUP_ID, same as on host"
    groupadd -g $GROUP_ID appgroup
    useradd --shell /bin/bash -u $USER_ID -o -c "" -m -g $GROUP_ID appuser
    export HOME=/home/appuser
    echo "[[ -e /mnt/appuser/.bashrc ]] && source /mnt/appuser/.bashrc" >> $HOME/.bashrc

    # Execute the initial command as that UID
    exec su-exec appuser "$@"
else
    exec "$@"
fi