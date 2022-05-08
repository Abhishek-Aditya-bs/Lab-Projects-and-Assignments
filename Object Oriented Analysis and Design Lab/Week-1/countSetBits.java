// Input a number from the user 
// and display the number of 1’s in the binary representation of the number

public class countSetBits
{
    public static void main(String[] args)
    {
        int n, count = 0;
        System.out.println("Enter a number: ");
        n = Integer.parseInt(System.console().readLine());
        int num = n;
        while(n > 0)
        {
            if(n % 2 == 1)
                count++;
            n = n / 2;
        }
        System.out.println("Number of 1’s in the binary representation of the number " + num + " is " + count);
    }
}