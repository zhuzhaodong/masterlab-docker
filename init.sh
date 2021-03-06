#!/bin/bash
set -eo pipefail


DEPS_REDIS_PACKAGE="deps/redis-4.2.0.tgz"
DEPS_MEMCACHE_PACKAGE="deps/memcached-3.0.4.tgz"

V1_DOCKERFILE_APACHE="v1/apache"
V1_DOCKERFILE_FPM="v1/fpm"

cp -f $DEPS_REDIS_PACKAGE $DEPS_MEMCACHE_PACKAGE $V1_DOCKERFILE_APACHE
cp -f $DEPS_REDIS_PACKAGE $DEPS_MEMCACHE_PACKAGE $V1_DOCKERFILE_FPM


bash -n v1/apache/entrypoint.sh
bash -n v1/fpm/entrypoint.sh
bash -n socket/entrypoint.sh
