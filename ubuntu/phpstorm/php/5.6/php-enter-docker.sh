#!/usr/bin/env bash

docker run -ti \
	--rm \
	-v "${HOME}":"${HOME}" \
	-v "${PWD}":"${PWD}" \
	-v /tmp/:/tmp/ \
	-w ${PWD} \
	--net=host \
	--sig-proxy=true \
	--pid=host \
	galileo/php:5.6-phpunit-5-advanced \
	bash
