// Create a class called MyNumber as shown below. To this class, add  a method to count the number of bits which are 1 in the binary representation of the number. Use the concept of package creation and importing the package 
// class MyNumber  {
//   private int value;   
//   // ctor 
//   // display method  
// }

package ThirdProgramPackage;

public class myNumber {
    private int value;
    
    public myNumber(int value) {
        this.value = value;
    }
    
    public int countBits() {
        int count = 0;
        while (value != 0) {
            if ((value & 1) == 1) {
                count++;
            }
            value = value >> 1;
        }
        return count;
    }
}