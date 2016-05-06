#!/bin/bash

# Running two dockers

docker run -i -t -d -v ${PWD}/www_root:/var/www/html teste:html /bin/bash
docker run -i -t -d -v ${PWD}/www_root:/var/www/html teste:html /bin/bash

