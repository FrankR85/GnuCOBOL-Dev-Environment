sudo apt-get update

sudo apt-get -y install apache2
cd /var/www/html
sudo ln -s /vagrant/www www
sudo ln -s /vagrant/www/fizzbuzz/index.html fizzbuzz

#enable CGI
cd /etc/apache2/mods-enabled
sudo ln -s ../mods-available/cgi.load

cd /etc/apache2/conf-available
sudo rm serve-cgi-bin.conf
sudo ln -s /vagrant/apache/config/serve-cgi-bin.conf serve-cgi-bin.conf
cd /usr/lib/cgi-bin/
#set symlinks to executable cobol pgms
sudo ln -s /vagrant/cobol/fizzbuzz/target/FIZZBUZZ fizzbuzz
sudo service apache2 restart

#setup cobol unit test
echo "Setting up COBOL Unit Test"

echo "cd /vagrant/cobol" >> /home/vagrant/.bashrc
