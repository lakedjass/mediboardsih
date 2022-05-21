sudo apt update -y
sudo apt update -y

echo "installing apache2"
sudo apt install apache2

echo "make enable apache2"
sudo systemctl enable apache2

echo "installing subversion and tools"
sudo apt install -y subversion subversion-tools libapache2-mod-svn

echo "check enable of modules"
sudo a2enmod dav
sudo a2enmod dav_svn

echo "restart apache2 service"
sudo service apache2 restart

echo "create svn config file"

cat << EOF | sudo tee /etc/apache2/mods-enabled/dav_svn.conf
<Location /svn>
 DAV svn
 SVNParentPath /var/lib/svn
 AuthType Basic
 AuthName "Subversion Repository"
 AuthUserFile /etc/apache2/dav_svn.passwd
 Require valid-user
</Location>
EOF

echo "create a first svn repository"
sudo mkdir -p /var/lib/svn/
sudo svnadmin create /var/lib/svn/testrepo
echo "change owner of file"
sudo chown -R www-data:www-data /var/lib/svn
echo "change rights of directory"
sudo chmod -R 775 /var/lib/svn

echo "create admn user with passord"
sudo htpasswd -cm /etc/apache2/dav_svn.passwd admin

echo "svn is installed"
echo "check in a browser to http://your_domain.com/svn/testrepo/"

