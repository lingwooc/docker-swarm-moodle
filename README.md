# docker-swarm-moodle

Quick and dirty setup of moodle 3.6.2 in PHP 7.2.14 for docker swarm. All required modules are compiled and installed along with xDebug.

Replace the following tags in the files:
 - #url# - root url of the site
 - #user# - database password
 - #password# - database username 
 - #registry# - url of the private registry

Run `./deploy` to build and deploy to a swarm.
