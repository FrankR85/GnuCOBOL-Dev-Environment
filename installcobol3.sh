sudo apt-get update
sudo apt-get install -y --force-yes build-essential libgmp3-dev libdb-dev

echo "download GnuCOBOL"
mkdir /home/vagrant/gnucobol3
mkdir /home/vagrant/gnucobol3/latest
wget  -O /home/vagrant/gnucobol3/latest.tar.gz "http://gnu.c3sl.ufpr.br/alpha/gnucobol/gnucobol-3.0-rc1.tar.xz"
cd /home/vagrant/gnucobol3
tar xvf latest.tar.gz -C /home/vagrant/gnucobol3/latest --strip-components=1
cd latest/

./configure
make
sudo make install
sudo ldconfig
