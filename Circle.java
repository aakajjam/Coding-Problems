/*// Problem 4 Java OOPs: Write a Java program to create a class called "Circle" with a radius attribute.
// You can access and modify this attribute.
// Calculate the area and circumference of the circle.
public class Circle {

    // Define the global variable
    int radius;

    // Create the constructor
    public Circle(){
        radius = 5;
    }

    // Create a getter method to modify the radius
    public double areaCircle(double radius){
        double area = 3.14 * (radius * radius);
        return area;
    }

    // Create a setter method to access the radius
    public double circumfrenceCircle(){
        double circumfrence = 2 * 3.14 * radius;
        return circumfrence;
    }
}*/

/*
public class Circle extends Shape{

    public double radius;

    public Circle(double radius){
        this.radius = radius;
    }

    @Override
    public double getPerimeter(){
        return 3.14 * 2 * radius;
    }

    @Override
    public double getArea(){
        return 3.14 * radius * radius;
    }
}*/
