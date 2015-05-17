#
#AFL-VERSIONS
#
#To compile targets with afl on linux (standard as maintainer intends it to be):
export CC=afl-gcc && export CXX=afl-g++ && ./configure --disable-shared && make clean && make 

#On OSX:
export CC=afl-clang && export CXX=afl-clang++ && ./configure --disable-shared && make clean && make 

#On odroid:
export CC=afl-clang-fast && export CXX=afl-clang-fast++ && ./configure --disable-shared && make clean && make

#For -C option of AFL:
export CFLAGS="-Wall -g -fsanitize=address -fno-omit-frame-pointer -fstack-protector-all -z noexecstack -D_FORTIFY_SOURCE=2" && export CC=afl-gcc && export CXX=afl-g++ && ./configure --disable-shared && make clean && make
#In shell where you will run the binary:
export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-3.4 && export ASAN_OPTIONS=symbolize=1:redzone=512:quarantine_size=512Mb:exitcode=1:abort_on_error=1



#
#GCC-VERSIONS
#
#For later debugging with ASAN you want:
export CFLAGS="-Wall -g -fsanitize=address -fno-omit-frame-pointer -fstack-protector-all -z noexecstack -D_FORTIFY_SOURCE=2" && export CC=gcc && export CXX=g++ && ./configure --disable-shared && make clean && make
#OR:
export CFLAGS="-Wall -g -fsanitize=address -fno-omit-frame-pointer -fstack-protector-all" && export CC=gcc && export CXX=g++ && ./configure --disable-shared && make clean && make
#OR without ASAN:
export CFLAGS="-Wall -g -fstack-protector-all -z noexecstack -D_FORTIFY_SOURCE=2" && export CC=gcc && export CXX=g++ && ./configure --disable-shared && make clean && make
#IMPORTANT: To get line numbers for files, use clang's ASAN:
sudo apt-get install clang
#In shell where you will run the binary:
export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-3.4 && export ASAN_OPTIONS=symbolize=1:redzone=512:quarantine_size=512Mb:exitcode=1
#see https://code.google.com/p/address-sanitizer/wiki/Flags




#For later exploit development without the security to start with (note: protections like ASLR still in place):
export CFLAGS="-Wall -g -fno-stack-protector -D_FORTIFY_SOURCE=0 -z execstack" && export CC=gcc && export CXX=g++ && ./configure --disable-shared && make clean && make 




