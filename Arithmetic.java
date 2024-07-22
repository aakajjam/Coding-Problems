import java.util.Scanner;


public class Arithmetic {

    // Problem 2: Print the sum of two numbers
    public int sum(int a, int b) {
        return a + b;
    }

    // Problem 3: Write a Java program to divide two numbers and print them on the screen
    public int quotient(int a, int b) {
        return a / b;
    }

    // Problem 5: Write a Java program that takes two numbers as input and displays the product of two numbers
    public int product(int a, int b) {
        return a * b;
    }

    // Write a Java program that takes a number as input and prints its multiplication table up to 10
    /*public void printMultiplicationTable() {
        System.out.println("Enter a number: ");
        Scanner scanner = new Scanner(System.in);
        int number = scanner.nextInt();
        for (int i = 1; i <= 10; i++) {
            System.out.println(number + " x " + i + " = " + (number * i));
        }
    }*/
    // Write a Java program that takes a number as input and prints its multiplication table up to 10
    public void printMultiplicationTable(int number) {
        for (int i = 1; i <= 10; i++) {
            System.out.println(number + " x " + i + " = " + (number * i));
        }
    }

    // Write a Java program to print the area of a circle
    public double area(double radius){
        return radius * radius * 3.14;
    }

    // Write a Java program to print the circumference of a circle
    public double circumference(double diameter){
        return diameter * 3.14;
    }

    // Write a Java program that takes three numbers as input to calculate and print the average of the numbers
    public double average(double first, double second, double third){
        return (first+second+third)/3;
    }

    // Write a program to compare two numbers
    public String compareNums(int first, int second){
        if (first == second){
            return "They are the same";
        }
        else if (first > second) {
            return "The first is bigger than the second";
        }
        else {
            return "The second is bigger than the first";
        }
    }
}
