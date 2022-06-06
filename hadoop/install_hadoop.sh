sudo apt update -y
#sudo apt upgrade -y

sudo apt-get install default-jdk -y

sudo useradd -m -U -d /opt/hadoop -s /bin/bash hadoop
echo -e "hadoop\nhadoop" |sudo passwd hadoop

ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub  >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
ssh localhost

wget https://archive.apache.org/dist/hadoop/core/hadoop-3.2.1/hadoop-3.2.1.tar.gz -P /tmp

sudo tar xzf /tmp/hadoop-3.2.1.tar.gz -C /opt/hadoop

sudo ln -svf /opt/hadoop/hadoop-3.2.1 /opt/hadoop/latest


cat << EOF | sudo tee  /etc/profile.d/hadoop.sh
#Hadoop Related Options
export HADOOP_HOME=/opt/hadoop/latest
export HADOOP_INSTALL=\$HADOOP_HOME
export HADOOP_MAPRED_HOME=\$HADOOP_HOME
export HADOOP_COMMON_HOME=\$HADOOP_HOME
export HADOOP_HDFS_HOME=\$HADOOP_HOME
export YARN_HOME=\$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=\$HADOOP_HOME/lib/native
export PATH=\$PATH:\$HADOOP_HOME/sbin:\$HADOOP_HOME/bin
export HADOOP_OPTS="-Djava.library.path=\$HADOOP_HOME/lib/native"
EOF

source /etc/profile.d/hadoop.sh



cat << EOF | sudo tee  $HADOOP_HOME/etc/hadoop/hadoop-env.sh
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
EOF

cat << EOF | sudo tee  $HADOOP_HOME/etc/hadoop/core-site.xml
<configuration>
<property>
<name>hadoop.tmp.dir</name>
<value>/opt/hadoop/latest/tmpdata</value>
</property>
<property>
<name>fs.default.name</name>
<value>hdfs://127.0.0.1:9000</value>
</property>
</configuration>
EOF

cat << EOF | sudo tee  $HADOOP_HOME/etc/hadoop/hdfs-site.xml
<configuration>
<property>
<name>dfs.data.dir</name>
<value>/opt/hadoop/latest/dfsdata/namenode</value>
</property>
<property>
<name>dfs.data.dir</name>
<value>/opt/hadoop/latest/dfsdata/datanode</value>
</property>
<property>
<name>dfs.replication</name>
<value>1</value>
</property>
</configuration>
EOF

cat << EOF | sudo tee  $HADOOP_HOME/etc/hadoop/mapred-site.xml
<configuration>
<property>
<name>mapreduce.framework.name</name>
<value>yarn</value>
</property>
</configuration>
EOF

cat << EOF | sudo tee  $HADOOP_HOME/etc/hadoop/yarn-site.xml
<configuration>
<property>
<name>yarn.nodemanager.aux-services</name>
<value>mapreduce_shuffle</value>
</property>
<property>
<name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
<value>org.apache.hadoop.mapred.ShuffleHandler</value>
</property>
<property>
<name>yarn.resourcemanager.hostname</name>
<value>127.0.0.1</value>
</property>
<property>
<name>yarn.acl.enable</name>
<value>0</value>
</property>
<property>
<name>yarn.nodemanager.env-whitelist</name>
<value>JAVA_HOME,HADOOP_COMMON_HOME,HADOOP_HDFS_HOME,HADOOP_CONF_DIR,CLASSPATH_PERPEND_DISTCACHE,HADOOP_YARN_HOME,HADOOP_MAPRED_HOME</value>
</property>
</configuration>
EOF

sudo cp check.sh /opt/hadoop/

sudo chown -R hadoop:hadoop /opt/hadoop
sudo su - hadoop -c "bash ~/check.sh"
