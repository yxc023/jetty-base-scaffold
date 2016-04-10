#!/usr/bin/env bash

if [ -f "main.pid" ]; then
    main_pid=`cat main.pid`
    count=`ps aux | grep $main_pid | wc -l`
    echo "stop" $main_pid
    java -jar ../../start.jar —stop STOP.PORT=18080 STOP.KEY=appName
fi
