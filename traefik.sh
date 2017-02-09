#!/bin/sh
#set -ex

# The path of the docker compose file
compose="$HOME/.traefik/docker-compose.yml"

case "$1" in
    start)
      docker-compose -f $compose up -d
      ;;

    stop)
      docker-compose -f $compose stop
      ;;

    restart|reload)
      docker-compose -f $compose restart
      ;;

    status)
      docker-compose -f $compose ps
      ;;

    clean)
      docker-compose -f $compose stop && \
      docker-compose -f $compose rm -f
      ;;

    logs)
      docker-compose -f $compose logs --follow
      ;;

    *)
      echo "usage: $0 <start|stop|restart|reload|status|clean|logs>" >&2
      exit 1
esac

exit 0
