import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.ValueSource;

import java.util.Scanner;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class ArithmeticTest {

    // Define the arithmetic object at the class level, so we don't have to keep repeating
    // defining the object
    Arithmetic arithmetic = new Arithmetic();

    // Problem 2: Print the sum of two numbers
    @Test
    void testAdd() {
        assertEquals(50, arithmetic.sum(25, 25), "This is the sum");
    }

    // Problem 3: Write a Java program to divide two numbers and print them on the screen
    @Test
    void testDivide() {
        assertEquals(5, arithmetic.quotient(100, 20), "This is the quotient");
    }

    // Problem 5: Write a Java program that takes two numbers as input and displays the product of two numbers
    @Test
    void testMultiply() {
        assertEquals(288, arithmetic.product(24, 10), "This is the product");
    }

    // Write a Java program to print the area of a circle
    @ParameterizedTest
    @ValueSource(doubles = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 0.0})
    void testArea(double radius) {
        double expectedArea = radius * radius * 3.14;
        assertEquals(expectedArea, arithmetic.area(radius), "This is the area of the circle");
    }

    // Write a Java program to print the circumference of a circle
    @ParameterizedTest
    @ValueSource(doubles = {1.0, 10.0, 100.0, 1000.0})
    void testCircumference(double diameter) {
        assertEquals(3.14 * diameter, arithmetic.circumference(diameter), "This is the circumference of the circle");
    }

    // Write a Java program that takes three numbers as input to calculate and print the average of the numbers
    @ParameterizedTest
    @CsvSource({"10,20,30", "1,2,3", "0,0,0", "1,1,1", "2,2,2"})
    void averageTest(int first, int second, int third) {
        double outcome = (first + second + third) / 3;
        assertEquals(outcome, arithmetic.average(first, second, third), "This is the average of three numbers");
    }

}

    /*// Write a Java program that takes a number as input and prints its multiplication table up to 10
    @Test
    void multiplesTest() {
        Scanner scanner = new Scanner(System.in);
        int number = scanner.nextInt();
        for (int i = 1; i <= 10; i++) {
            assertEquals(number * 10,arithmetic.printMultiplicationTable());
        }*/


