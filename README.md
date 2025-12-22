# vlang-testu01
Test RNG by TestU01 via vlang
```
clone repo
cd vlang-testu01/
cd TestU01-1.2.3/
./configure
make -j8
cd ..

on alpine linux do static:
v -cc gcc -cflags -static -prod rdrand.v

on debian (glibc):


```
