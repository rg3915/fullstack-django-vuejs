#!/bin/sh

set -e
set -u

OPTIND=1

ACTION=$1

banner () {
  echo ""
  printf "\n@> Starting web server...\n"
  echo "@=> APP_VERSION     = ${APP_VERSION}"
  echo "@=> GIT_HASH        = ${GIT_HASH}"
  echo "@=> BUILD_DATE      = ${BUILD_DATE}"
  echo "@=> MODE            = ${MODE}"
  echo ""
  echo "@=> ACTION = ${ACTION}"
  echo ""
}

httpMode () {
  nginx -g 'daemon off;'
}

debugMode () {
  nginx-debug -g 'daemon off;'
}

case $ACTION in
  http)
  banner && httpMode
  ;;
  debug)
  banner && \
    debugMode
  ;;
  *)
  exec "$@"
  ;;
esac