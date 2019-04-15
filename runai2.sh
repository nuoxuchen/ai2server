#!/usr/bin/bash
#
#
#

export ANT_HOME=/opt/apache-ant
export JAVA_HOME=/opt/java
export JRE_HOME=/opt/java/jre
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin:$ANT_HOME/bin:/opt/appengine-java-sdk/bin
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib

#pkill -9 java

nohup dev_appserver.sh --port=8888 --address=localhost  --disable_update_check /home/ai2/ai2server/war/ &> /home/ai2/ai2server/pid/ai2d.log &
echo $! > /home/ai2/ai2server/pid/ai2d.pid

cd /home/ai2/ai2server/lib
nohup java -Xmx1828m -cp "*" -Dfile.encoding=UTF-8 com.google.appinventor.buildserver.BuildServer --dexCacheDir /tmp/ &> /home/ai2/ai2server/pid/ai2b.log &
echo $! > /home/ai2/ai2server/pid/ai2b.pid