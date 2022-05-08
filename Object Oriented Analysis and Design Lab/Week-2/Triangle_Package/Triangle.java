// create a class named Triangle with the following attributes and functions:
// attributes:
// double side1, side2, side3
// methods:
// constructor with 3 parameters
// find whether the traingle can be formed or not
// find the area of the triangle
// find the perimeter of the triangle
// find whether two triangles are equal or not
// Provide facilities for changing the sides of the triangle individually after creation of it

package Triangle_Package;
public class Triangle {
    
    private double side1, side2, side3;
    
    public Triangle(double side1, double side2, double side3) {
        this.side1 = side1;
        this.side2 = side2;
        this.side3 = side3;
    }
    
    public boolean isTriangle() {
        if ((side1 > 0 && side2 > 0 && side3 > 0) && side1 + side2 > side3 && 
                side1 + side3 > side2 && side2 + side3 > side1) {
            return true;
        }
        else {
            return false;
        }
    }
    // find the area of the triangle
    public double getArea() {
        double s = (side1 + side2 + side3) / 2;
        double area = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
        return area;
    }
    // find the perimeter of the triangle
    public double getPerimeter() {
        return side1 + side2 + side3;
    }
    // find whether two triangles are equal or not
    public boolean isEqual(Triangle t) {
        if (side1 == t.side1 && side2 == t.side2 && side3 == t.side3) {
            return true;
        }
        else {
            return false;
        }
    }
    // provide facilities for changing the sides of the triangle individually after creation of it
    public void setSide1(double side1) {
        this.side1 = side1;
    }
    public void setSide2(double side2) {
        this.side2 = side2;
    }
    public void setSide3(double side3) {
        this.side3 = side3;
    }
}