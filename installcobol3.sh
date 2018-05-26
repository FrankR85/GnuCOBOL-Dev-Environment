sudo apt-get update
sudo apt-get install -y --force-yes libgmp3-dev libdb-dev automake flex bison help2man texinfo

echo "download GnuCOBOL"
mkdir /vagrant/gnucobol3
mkdir /vagrant/gnucobol3/latest
wget  -O /vagrant/gnucobol3/latest.tar.gz "https://sourceforge.net/projects/open-cobol/files/gnu-cobol/3.0/gnucobol-3.0-rc1.tar.gz/download"
cd /vagrant/gnucobol3
tar xvf latest.tar.gz -C /vagrant/gnucobol3/latest --strip-components=1
cd latest/

./configure
aclocal
automake
make
sudo make install
sudo ldconfig
