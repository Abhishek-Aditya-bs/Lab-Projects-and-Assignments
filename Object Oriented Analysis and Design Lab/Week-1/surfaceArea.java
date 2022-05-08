// Write a program to find surface area of a cylinder: 2PIr*r+2PIr*h
// Hint: Use Math.PI

public class surfaceArea
{
    public static void main(String[] args)
    {
        // accepting radius and height from user
        System.out.println("Enter radius: ");
        double r = Double.parseDouble(System.console().readLine());
        System.out.println("Enter height: ");
        double h = Double.parseDouble(System.console().readLine());
        double area = 2 * Math.PI * r * (r + h);
        System.out.println("Surface area of a cylinder with radius " + r + " and height " + h + " is " + area);
    }
}
