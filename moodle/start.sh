#!/bin/bash

rm /var/run/httpd/httpd.pid

service apache2 start

while true; do sleep 1; done