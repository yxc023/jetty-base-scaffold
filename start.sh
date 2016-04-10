#!/usr/bin/env bash

if [ -f "main.pid" ]; then
    main_pid=`cat main.pid`
    count=`ps aux | grep $main_pid | wc -l`
    if [[ $count -gt "1" ]]; then
        ps aux | grep $main_pid
        echo "进程好像已经在运行了..."
        exit
    fi
fi

nohup java -jar ../../start.jar STOP.PORT=18080 STOP.KEY=appName >/dev/null 2>&1 &
echo $! > main.pid
echo "start at pid:" `cat main.pid`
