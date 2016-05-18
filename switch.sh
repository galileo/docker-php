#!/usr/bin/env bash

NAME_SUFFIX="-d"

if [ -z $1 ];
then
    echo "Please provide php version to install [current only 5.6 is supported]" $1
elif [ $1 != '5.6' ]
then
    echo "First argument must be [ 5.6 ]"
else
    echo "Installation for 5.6 started"
fi

rm -f /usr/local/bin/php${NAME_SUFFIX}
rm -f /usr/local/bin/php${NAME_SUFFIX}x
rm -f /usr/local/bin/phpunit${NAME_SUFFIX}
rm -f /usr/local/bin/composer${NAME_SUFFIX}
rm -f /usr/local/bin/phpstorm${NAME_SUFFIX}
rm -f /usr/local/bin/enter-php${NAME_SUFFIX}

ln -s ${PWD}/ubuntu/phpstorm/php/$1/php.sh /usr/local/bin/php${NAME_SUFFIX}
ln -s ${PWD}/ubuntu/phpstorm/php/$1/php-xdebug.sh /usr/local/bin/php${NAME_SUFFIX}x
ln -s ${PWD}/ubuntu/phpstorm/php/$1/phpstorm.sh /usr/local/bin/phpstorm${NAME_SUFFIX}
ln -s ${PWD}/ubuntu/phpstorm/php/$1/phpunit.sh /usr/local/bin/phpunit${NAME_SUFFIX}
ln -s ${PWD}/ubuntu/phpstorm/php/$1/composer.sh /usr/local/bin/composer${NAME_SUFFIX}
ln -s ${PWD}/ubuntu/phpstorm/php/$1/php-enter-docker.sh /usr/local/bin/enter-php${NAME_SUFFIX}