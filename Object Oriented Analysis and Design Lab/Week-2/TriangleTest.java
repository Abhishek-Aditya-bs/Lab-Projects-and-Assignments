import Triangle_Package.Triangle;
public class TriangleTest {
    
    public static void main(String[] args) {
        Triangle t1 = new Triangle(3, 4, 5);
        Triangle t2 = new Triangle(3, 4, 5);
        Triangle t3 = new Triangle(3, 4, 6);
        System.out.println("t1 is a triangle: " + t1.isTriangle());
        System.out.println("t2 is a triangle: " + t2.isTriangle());
        System.out.println("t3 is a triangle: " + t3.isTriangle());
        System.out.println("t1 area: " + t1.getArea());
        System.out.println("t2 area: " + t2.getArea());
        System.out.println("t3 area: " + t3.getArea());
        System.out.println("t1 perimeter: " + t1.getPerimeter());
        System.out.println("t2 perimeter: " + t2.getPerimeter());
        System.out.println("t3 perimeter: " + t3.getPerimeter());
        System.out.println("t1 and t2 are equal: " + t1.isEqual(t2));
        System.out.println("t1 and t3 are equal: " + t1.isEqual(t3));
        System.out.println("t2 and t3 are equal: " + t2.isEqual(t3));
        System.out.println("Setting t1 side1 to 99, t1 side2 to 88, t1 side3 to 77");
        t1.setSide1(99);
        t1.setSide2(88);
        t1.setSide3(77);
        System.out.println("t1 is a triangle: " + t1.isTriangle());
        System.out.println("t1 area: " + t1.getArea());
        System.out.println("t1 perimeter: " + t1.getPerimeter());
    }
}
