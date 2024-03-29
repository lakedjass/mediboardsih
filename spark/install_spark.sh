
sudo apt-get install default-jdk -y
sudo apt-get install scala -y

wget https://downloads.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz -P /tmp

sudo tar -xvzf /tmp/spark-3.2.1-bin-hadoop3.2.tgz

sudo mkdir /opt/spark
sudo tar -xvzf /tmp/spark-3.2.1-bin-hadoop3.2.tgz -C /opt/spark

sudo ln -svf /opt/spark/spark-3.2.1-bin-hadoop3.2 /opt/spark/latest


cat << EOF | sudo tee  /etc/profile.d/spark.sh
export SPARK_HOME=/opt/spark/latest
export PATH=\$PATH:\$SPARK_HOME/bin:\$SPARK_HOME/sbin
EOF

source /etc/profile.d/spark.sh

sudo chown -R $USER:$USER /opt/spark
start-master.sh 
start-worker.sh spark://$HOSTNAME:7077
#SPARK_MASTER_WEBUI_PORT=<your preferred port>

#conf/spark-env.sh