#Download & compile new AFL version:
#sudo apt-get install clang
wget http://lcamtuf.coredump.cx/afl.tgz
tar xfz afl.tgz
rm afl.tgz
echo "Installing:"
echo `find . -type d -iname "afl-*"|sort|tail -1`
cd `find . -type d -iname "afl-*"|sort|tail -1`
export CC=clang
export CXX=clang++
export AFL_NOX86=1
make
cd llvm_mode
make
cd ..
echo "Provide sudo password for sudo make install"
sudo AFL_NOX86=1 make install
sudo rm /usr/local/bin/afl-clang
sudo rm /usr/local/bin/afl-clang++
sudo ln -s /usr/local/bin/afl-clang-fast /usr/local/bin/afl-clang
sudo ln -s /usr/local/bin/afl-clang-fast++ /usr/local/bin/afl-clang++
