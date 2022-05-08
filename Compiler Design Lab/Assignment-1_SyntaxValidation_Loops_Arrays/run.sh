rm -rf OUTPUT.txt
make clean
make -f makefile
echo "Test File 1" >> OUTPUT.txt
./a.out < test.c >> OUTPUT.txt
echo " " >> OUTPUT.txt
echo "Test File 2" >> OUTPUT.txt
./a.out < test2.c >> OUTPUT.txt

