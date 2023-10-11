#!/bin/bash

# Check if httpd is running
if pgrep -x "httpd" >/dev/null
then
    echo "HTTPD is running"
else
    echo "HTTPD is not running, starting HTTPD..."
    sudo systemctl start httpd
fi
