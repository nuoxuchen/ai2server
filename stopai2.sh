#!/usr/bin/bash
#
#

#pkill -9 java

read PID < /home/ai2/ai2server/pid/ai2d.pid

kill -15 $PID

read PID < /home/ai2/ai2server/pid/ai2b.pid

kill -15 $PID