/*// Overriding and Overloading in Inheritance - Test Automation University Example Problem - Chapter 9c
public class Square extends Rectangle{

    // This is overriding - We keep the exact same method name and parameters inside the parenthesis BUT change the body inside the method
    @Override // Lets Java know we want to Override
    public double calculatePerimeter(){
        return sides * length; // We don't need to declare sides and length since we inherited those variables from the Rectangle class
    }

    // This is overloading - We keep the same method name BUT change the parameters inside our parenthesis. We can change the data type as well if we want
    public void print(String what){
        System.out.println("I am a " + what);
    }
}*/

