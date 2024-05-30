/*// Try Catch Example Problem
import java.util.Scanner;
public class Exceptions {
    public static void main(String args[]) {
        Scanner inputDevice = new Scanner(System.in);

        // Ask user to give the numerator
        System.out.print("Enter the first number(numerator)");
        int numerator = inputDevice.nextInt();

        // Ask user to give the denominator
        System.out.print("Enter the second number(denominator");
        int denominator = inputDevice.nextInt();

        // Call on the function
        new Exceptions().doDivide(numerator, denominator);
    }
    public void doDivide(int a, int b){
        try{
            // What potential error might occur
            float result = a/b;
            System.out.print("Division Result of " + a + "/" + b + "= " + result);
        }
        // Catch the object that is thrown as a result of the error in the try statement
        catch (ArithmeticException e){
            System.out.println("Exception Condition Program is ending");
            System.out.println("You can't divide by zero");
        }
    }
}*/


/*// Problem 1 Java Exceptions: Write a Java program that throws an exception and catch it using a try-catch block.
public class Exceptions {
    public static void main(String args[]){

        // Define a negative number
        int number = -25;
        int second = -100;

        // Print out the variable second - just for reference
        System.out.println("This is second: " + Math.sqrt(second));

        // Try potential exceptions to the square root
        try{
            // Do the square root of the negative number and save it to a variable
            double squareRoot = Math.sqrt(number);
            throw new IllegalArgumentException();
        }
        // Catch the exception and print the message below
        catch(IllegalArgumentException e){
            System.out.println("Exception: You can't do the square root of a negative number");
            return;
        }

        // If the number is greater than 0, print the statement below
    }
}*/




