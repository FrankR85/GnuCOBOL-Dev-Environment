sudo apt-get update
sudo apt-get install -y --force-yes libgmp3-dev libdb-dev

echo "download GnuCOBOL"
mkdir /home/vagrant/gnucobol3
mkdir /home/vagrant/gnucobol3/latest
wget  -O /home/vagrant/gnucobol3/latest.tar.gz "https://sourceforge.net/projects/open-cobol/files/gnu-cobol/3.0/gnucobol-3.0-rc1.tar.xz/download"
cd /home/vagrant/gnucobol3
tar xvf latest.tar.gz -C /home/vagrant/gnucobol3/latest --strip-components=1
cd latest/

./configure
make
sudo make install
sudo ldconfig
