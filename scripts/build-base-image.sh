#!/bin/bash

RELEASE_DIR='./docker';
REPO_NAME='soulteary/doocs-md'

for app_ver in $RELEASE_DIR/*; do
    tag=$(echo $app_ver | cut -b 10-);
    echo "Build: $tag";
    set -a
        . "$app_ver/.env"
    set +a

    if [ -f "$app_ver/Dockerfile.base" ]; then

        echo $app_ver
        echo "VER_APP: $VER_APP"
        echo "VER_NGX: $VER_NGX"
        echo "VER_GOLANG: $VER_GOLANG"
        echo "VER_ALPINE: $VER_ALPINE"

        docker build --build-arg VER_APP=$VER_APP -f "$app_ver/Dockerfile.base" -t "doocs/md:${VER_APP}-assets" "$app_ver"
    fi

done