// Test Automation University - Methods
/*
public class Rectangle {

    private double length;
    private double width;

    public Rectangle(){ // This is a constructor
        length = 0;
        width = 0;
    }

    public Rectangle(double length, double width){ // This is also a constructor
        this.length = length; //can be set this way
        setWidth(width); //or can be set this way. These are only different here to demo alternative options
    }

    public double getLength(){
        return length;
    }

    public void setLength(double length){
        this.length = length;
    }

    public double getWidth(){
        return width;
    }

    public void setWidth(double width){
        this.width = width;
    }

    public double calculatePerimeter(){
        return (2 * length) + (2 * width);
    }

    public double calculateArea(){
        return length * width;
    }
}*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*// Overriding and Overloading in Inheritance - Test Automation University Example Problem - Chapter 9c
public class Rectangle{

    protected double length;
    protected double width;
    protected double sides = 4;

    public double getLength(){
        return length;
    }

    public void setLength(double length){
        this.length = length;
    }

    public double getWidth(){
        return width;
    }

    public double setWidth(double width){
        return this.width = width;
    }

    public double getSides(){
        return sides;
    }

    public void setSides(double sides){
        this.sides = sides;
    }

    public double calculatePerimeter(){
        return (2 * length) + (2 * width);
    }

    public void print(){
        System.out.println("I am a Rectangle");
    }
}*/

/*// Problem 3 Java Inheritance: Write a Java program to create a class called Shape with a method called getArea().
// Create a subclass called Rectangle that overrides the getArea() method to calculate the area of a rectangle.
public class Rectangle extends Shape{

   // Create the global variables to store the length and width values
   public double length;
   public double width;

   // Create a constructor to provide the length and width in order to save them in the global variables length and width
    public Rectangle(double length, double width){
        this.length = length;
        this.width = width;
    }

   // Override the ShapeArea method from the Shape class and get the area doing length * width
    @Override
    public double ShapeArea(){
        return length * width;
    }
}*/

