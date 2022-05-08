rm -rf temp.txt
rm -rf OUTPUT.txt
make -f makefile >> temp.txt
echo "lab-1_test-1_valid.c" >> OUTPUT.txt
./a.out < lab-1_test-1_valid.c >> OUTPUT.txt
echo " " >> OUTPUT.txt
echo "lab-1_test-2_valid.c" >> OUTPUT.txt
./a.out < lab-1_test-2_valid.c >> OUTPUT.txt
echo " " >> OUTPUT.txt
echo "lab-1_test-1_invalid.c" >> OUTPUT.txt
./a.out < lab-1_test-1_invalid.c >> OUTPUT.txt
echo " " >> OUTPUT.txt
echo "lab-1_test-2_invalid.c" >> OUTPUT.txt
./a.out < lab-1_test-2_invalid.c >> OUTPUT.txt
echo " " >> OUTPUT.txt
