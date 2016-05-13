#!/usr/bin/env bash

# Run PHP for phpstorm through Docker
docker run -i \
	--rm \
	-e IDE_PHPUNIT_CUSTOM_LOADER="/usr/local/bin/phpunit" \
	-v "${HOME}":"${HOME}" \
	-v "${PWD}":"${PWD}" \
	-v /tmp/:/tmp/ \
	-w ${PWD} \
	--net=host \
	--sig-proxy=true \
	--pid=host \
	galileo/php:5.6-phpunit-5-advanced \
	php -d memory_limit=-1 phpunit "$@"

# Attributes explanation
# --rm 
# -e IDE_PHPUNIT_CUSTOM_LOADER="/usr/local/bin/phpunit" - required by phpstorm because the choose of unit test i done via env variables
# -v "${PWD}":"${PWD}" - we need to send to the container also the current directory to act as on a local machine
# -v "${HOME}":"${HOME}" - phpstorm is calling all with absolute path so we need to add all files from home (its the safest way to ensure that all is working well)
# -v /tmp/:/tmp/ - we need to add host tmp to container tmp because phpstorm creates ide-phpstorm.php file that is required to call unit from storm
# -w ${PWD} - when you run some command it will be act like local called command
# --net=host - network will be setted to the host, that container will have access to all host addresses and ports
# --sig-proxy=true - pushing singals into container
# --pid=host - main process id is set to the host one
# php "$@" - command fired at begin with all parameters given to the bash script file
