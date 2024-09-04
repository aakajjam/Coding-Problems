// Link to JUnit Practice Problems: https://www.cs.umd.edu/~egolub/131exemption/JUnit.shtml

import org.junit.jupiter.api.RepeatedTest;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Timeout;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvFileSource;
import org.junit.jupiter.params.provider.CsvSource;

import org.junit.jupiter.params.provider.ValueSource;

import java.lang.reflect.Method;
import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

class JUnitPracticeProblemsTest {

    // Create an object of the JUnitPracticeProblems class so we don't have to keep calling it everytime
    JUnitPracticeProblems problems = new JUnitPracticeProblems();


    // Write a JUnit test assuming you have two String references named strOne an strTwo and
    // you only want it to pass if the two Strings contain the same characters.
    @ParameterizedTest
    @CsvSource({"Hello, World", "Java, Java", "C, C++", "Java, Javascript", "Swift, Swift"})
    void wordsTest(String strOne, String strTwo) {
        assertEquals("These strings are the same", problems.words(strOne, strTwo));
        System.out.println("strOne = " + strOne + " strTwo = " + strTwo);
    }

    // Write a JUnit test assuming you have two String references named strOne an strTwo and
    // you only want it to pass if the two Strings contain the same characters.
    @ParameterizedTest
    @CsvSource({"Hello, World", "Java, Java", "C, C++", "C++, C#", "Python, Python", "R,R"})
    void sameOrNotTest(String first, String second) {
        assertTrue(problems.sameOrNot(first, second));
        System.out.println("first = " + first + " second = " + second);
    }

    @ParameterizedTest
    @CsvFileSource(files = "C:\\Users\\aksha\\IdeaProjects\\JUnit5-learning\\src\\test\\resources\\params\\words.csv",
            numLinesToSkip = 1)
    void sameWordOrNot(String first, String last) {
        assertFalse(problems.sameOrNot(first, last));
        System.out.println("first = " + first + ", second = " + last);
    }

    // Write a JUnit test assuming you have an array of int values and
    // you only want the JUnit test to fail if any of the values are less than 20.
    @Test
    void failLessthan20() {
        int[] testArray = {39, 30, 399, 77, 200, 12, 90};
        for (int i = 0; i < testArray.length; i++) {
            System.out.println("index of " + i + " value of " + testArray[i]);
            assertTrue(testArray[i] > 20, "Failed because value of " +
                    testArray[i] + " at index " + i + " is less than 20");
        }
    }

    @ParameterizedTest
    @ValueSource(ints = {39, 30, 399, 77, 200, 12, 10, 5})
    void below20(int values) {
        if (values < 20) {
            System.out.println(values);
            assertTrue(values > 20);
        }
    }

    //Write a JUnit test assuming you have two StringBuffer references named sbOne and sbTwo and
    //you only want it to pass if the two references point to the same StringBuffer object.
    @Test
    void wordStringBufferTestSameReference(){
        StringBuffer sbOneTest = problems.wordStringBuffer("Javascript");
        StringBuffer sbTwoTest = sbOneTest;
        assertSame(sbOneTest, sbTwoTest);
        // This will pass since we reference sbOneTest to sbTwoTest
    }

    @Test
    void wordStringBufferTestDifferentReference(){
        StringBuffer sbOneTest = new StringBuffer("Javascript");
        StringBuffer sbTwoTest = new StringBuffer("Javascript");
        assertSame(sbOneTest, sbTwoTest,"If the assert fails, then the references are NOT the same");
        // This will fail since we created two different instances thus not referencing the same object
    }

    @RepeatedTest(3)
    void wordStringBufferTestReference(){
        StringBuffer sbOneTest = problems.wordStringBuffer("Javascript");
        StringBuffer sbTwoTest = problems.wordStringBuffer("Swift");
        assertNotSame(sbOneTest, sbTwoTest,"If the assert fails, then the references are NOT the same");
        // This will pass since the references are NOT the same
    }

    @Test
    void wordStringTest(){
        String first_test = problems.wordString("Python");
        String second_test = problems.wordString("Python");
        assertSame(first_test, second_test);
        // This will fail since there are two different references
    }

///////////////////////////////////////////////////////////////////////////////
// Link to the other JUnit Practice Problems
// https://www.w3resource.com/java-exercises/unittest/index.php

    // Write a Java unit test case to assert that a given method returns the expected value.
    @Test
    void termTest(){
        assertEquals("Rust", problems.term("Rust"));
    }

    @Test
    void exponentTest(){
        assertEquals(100, problems.exponent(10,2));
    }

    // Write a Java test case to verify that a specific exception is thrown when a method is called with invalid input.
    @Test
    void invalidInputDivisionTest(){
        assertThrows(IllegalArgumentException.class, () -> {problems.invalidInputDivision(0,0);});
    }

    @ParameterizedTest
    @CsvSource({"0,9","0,0", "-1,-4","2,0"})
    void invalidInputExponentsTest(int base, int power){
        assertThrows(IllegalArgumentException.class, () -> {problems.invalidInputExponents(base,power);});
    }

    // Throw an invalid input error when giving the wrong inputs for the test
    // Come back to this one
    @ParameterizedTest
    @CsvSource({"Clark, Kent", "Bruce, Wayne", "John, Stuart"})
    void invalidInputs(int first, int second){
        assertThrows(NumberFormatException.class,() -> {problems.invalidInputExponents(first,second);});
    }

    // Write a Java program that implements parameterized test to verify that a method behaves correctly for different input values.
    @ParameterizedTest
    @CsvSource({"1.0,1", "3.2, 10.0", "9,8.7", "3,5"})
    void cylinderVolumeTest(double radius_test, double height_test){
       double expectedValue = 3.14 * radius_test * radius_test * height_test;
       assertEquals(expectedValue, problems.cylinderVolume(radius_test, height_test));
    }

    @ParameterizedTest
    @CsvSource({"Black, Panther", "'J', Jamison"})
    void marvelCharactersTest(String firstName, String lastName){
        System.out.println(firstName + " " + lastName);
    }

   // Write a Java test case that is intentionally ignored, and explain the scenarios where test skipping might be useful.
   @ParameterizedTest // Check why this one is not skipping -1,0
   //@CsvSource({"1.0,1", "3.2, 10.0", "9,8.7", "-1,0","3,5"})
   @CsvSource({"0,0"})
   void greaterThanZeroTest(double radius_test, double height_test){
       if (radius_test > 0){
           double expectedValue = 3.14 * radius_test * radius_test * height_test;
           assertEquals(expectedValue, problems.cylinderVolume(radius_test, height_test));
       }
   }

    @ParameterizedTest
    @CsvSource({"1.0,1", "3.2, 10.0", "9,8.7", "-1,0", "3,5"})
    void greaterThanZeroTestAssumption(double radius_test, double height_test){
        assumeTrue(radius_test > 0 && height_test > 0);
        double expectedValue = 3.14 * radius_test * radius_test * height_test;
        assertEquals(expectedValue, problems.cylinderVolume(radius_test, height_test));
    }

   @ParameterizedTest
   @CsvFileSource(files = "C:\\Users\\aksha\\IdeaProjects\\JUnit5-learning\\src\\test\\resources\\params\\words.csv",
           numLinesToSkip = 1)
    void skippingNamesTest(String firstName, String lastName){
        assumeTrue(firstName != null && lastName != null); // How to check for empty string
   }

   // Write a Java test case that fails if a method takes longer than a specified time to execute.
   // Come back to this problem
   @Test
   @Timeout(5)
   void timeout() throws InterruptedException {
       System.out.println("This is the test with the timeout");
       Thread.sleep(6000);
   }

   @ParameterizedTest
   @CsvFileSource(files = "C:\\Users\\aksha\\IdeaProjects\\JUnit5-learning\\src\\test\\resources\\params\\words.csv",
           numLinesToSkip = 1)
   @Timeout(value = 100, unit = TimeUnit.MILLISECONDS)
   void skippingNamesTimeTest(String firstName, String lastName) throws InterruptedException {
       assumeTrue(firstName != null && !firstName.isEmpty() &&
               lastName != null && !lastName.isEmpty(),"Assumption is people have first and last names");
       Thread.sleep(1000);
   }
   
   // Write a Java program to explore strategies for testing private methods in a class.
   // Use the Reflection API
   @ParameterizedTest
   @CsvSource({"1,2,3", "5,10,4"})
   void trapezoidAreaTest(int b1, int b2, int h) throws Exception {
       // Accessing private method
       Method accessing_private_method = problems.getClass().getDeclaredMethod("trapezoidArea", int.class, int.class, int.class);
       accessing_private_method.setAccessible(true);

       // Invoking/calling on the method on the problems object
       // Typecast to (double) since accessing_private_method gives us an object
       double actualResult = (double) accessing_private_method.invoke(problems, b1, b2, h);

       // Give the expectedResult
       double expectedResult = ((b1 + b2) * h) / 2;

       // Now check the test using assertEquals
       assertEquals(expectedResult, actualResult);
   }

    // Write a Java program that tests a singleton class, ensuring it behaves as expected in a multi-threaded environment.
   @Test
   void singletonTest() throws InterruptedException{
        // Create two thread objects
        Thread first_thread = new Thread();
        Thread second_thread = new Thread();

        // Create the singleton classes
        Browser web1 = Browser.getInstance();
        Browser web2 = Browser.getInstance();

        assertSame(web1, web2);

        // Start the new the threads
        first_thread.start();
        second_thread.start();

        // Wait for threads to finish
        first_thread.join();
        second_thread.join();
   }
}
