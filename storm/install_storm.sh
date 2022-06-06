wget https://dlcdn.apache.org/storm/apache-storm-2.4.0/apache-storm-2.4.0.tar.gz -P /tmp
sudo mkdir /opt/storm
sudo tar zxf /tmp/apache-storm-2.4.0.tar.gz -C /opt/storm
sudo ln -svf /opt/storm/apache-storm-2.4.0 /opt/storm/latest
sudo mkdir /opt/storm/latest/data

cat << EOF | sudo tee  /etc/profile.d/storm.sh
export STORM_HOME=/opt/storm/latest
export PATH=\$PATH:\$STORM_HOME/bin
EOF

source /etc/profile.d/storm.sh

cat << EOF | sudo tee  $STORM_HOME/conf/storm.yaml
storm.zookeeper.servers:
- "localhost"
storm.local.dir: “$STORM_HOME/data”
nimbus.host: "localhost"
ui.port: 8081
supervisor.slots.ports:
- 6700
- 6701
- 6702
- 6703
EOF
sudo chown -R $USER:$USER /opt/storm
