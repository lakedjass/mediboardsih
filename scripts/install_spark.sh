sudo apt-get install scala -y

wget https://downloads.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz -P /tmp

sudo tar -xvzf /tmp/spark-3.2.1-bin-hadoop3.2.tgz

#mv /tmp/spark-3.2.1-bin-hadoop3.2 /opt/spark

cat << EOF | sudo tee  /etc/profile.d/spark.sh
export SPARK_HOME=/opt/spark
export PATH=\$PATH:\$SPARK_HOME/bin:\$SPARK_HOME/sbin
EOF

source /etc/profile.d/spark.sh

start-master.sh 
start-worker.sh spark://$HOSTNAME:7077
SPARK_MASTER_WEBUI_PORT=<your preferred port>