sudo apt-get install -y --force-yes libgmp3-dev libdb-dev automake flex bison help2man texinfo

cd /vagrant/gnucobol3
tar xvf gnucobol-3.0-rc1.tar.gz
cd gnucobol-3.0-rc1/

./configure
aclocal
automake
make
sudo make install
sudo ldconfig
