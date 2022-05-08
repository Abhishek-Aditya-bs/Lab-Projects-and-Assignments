import ThirdProgramPackage.myNumber;
public class myNumberDriver {
    
    public static void main(String[] args) {
        // take input from user
        System.out.println("Enter a number: ");
        int num = Integer.parseInt(System.console().readLine());
        myNumber n = new myNumber(num);
        System.out.println("Number of 1's in the binary representation of " + num + " is " + n.countBits());
    }
}
