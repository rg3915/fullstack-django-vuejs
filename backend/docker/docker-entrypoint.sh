#!/bin/sh

set -e
set -u

OPTIND=1

ACTION=$1

banner () {
  echo "
    ██████╗  █████╗  ██████╗██╗  ██╗███████╗███╗   ██╗██████╗ 
    ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔════╝████╗  ██║██╔══██╗
    ██████╔╝███████║██║     █████╔╝ █████╗  ██╔██╗ ██║██║  ██║
    ██╔══██╗██╔══██║██║     ██╔═██╗ ██╔══╝  ██║╚██╗██║██║  ██║
    ██████╔╝██║  ██║╚██████╗██║  ██╗███████╗██║ ╚████║██████╔╝
    ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═════╝ 
  "
  printf "\n@> Starting api...\n"
  echo "@=> APP_VERSION     = ${APP_VERSION}"
  echo "@=> GIT_HASH        = ${GIT_HASH}"
  echo "@=> BUILD_DATE      = ${BUILD_DATE}"
  echo "@=> DJANGO_ENV      = ${DJANGO_ENV}"
  echo "@=> SERVER_PORT     = ${SERVER_PORT}"
  echo ""
  echo "@=> ACTION = ${ACTION}"
  echo ""
}

runCollectstatic () {
  rm -rf /app/staticfiles /app/static && \
  python manage.py collectstatic -c --noinput && \
    cp -r /app/staticfiles /app/static
}

runServer () {
  runCollectstatic && \
    gunicorn api.wsgi:application -b 0.0.0.0:$SERVER_PORT --daemon && \
    nginx -g 'daemon off;'
}

runManage () {
  shift
  python manage.py "$@"
}

case $ACTION in
  server)
  banner && runServer
  ;;
  manage)
  runManage "$@"
  ;;
  *)
  exec "$@"
  ;;
esac