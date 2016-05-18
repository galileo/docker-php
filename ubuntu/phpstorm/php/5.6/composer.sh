#!/usr/bin/env bash

docker run -i \
	--rm \
	-v "${HOME}":"${HOME}" \
	-v "${PWD}":"${PWD}" \
	-v /tmp/:/tmp/ \
	-w ${PWD} \
	--net=host \
	--sig-proxy=true \
	--pid=host \
	galileo/php:5.6-advanced-phpunit-5 \
	php -d memory_limit=-1 /usr/local/bin/composer "$@"
