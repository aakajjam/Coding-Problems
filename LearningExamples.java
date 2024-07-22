/*package JUnit5Tests;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

// This is for Test Automation University Module JUnit Chapter 2: Writing Tests
public class FirstTestClass {

    @Test
    void firstMethod(){
        System.out.println("This is the first test method");
    }

    @Test
    @DisplayName("US1234 - TC12 - this method is the second one")
    void secondMethod(){
        System.out.println("This is the second test method");
    }
}*/

/*// This is for Test Automation University Module JUnit Chapter 3: Lifecycle Methods
package JUnit5Tests;

import org.junit.jupiter.api.*;

@TestInstance(TestInstance.Lifecycle.PER_CLASS) // We use this annotation to we don't have to mark each of the setup and cleanup methods as static
public class FirstTestClass {

    @BeforeAll
    void beforeAll(){
        System.out.println("-- This is the Before All method");
    }

    @BeforeEach
    void beforeEach(){
        System.out.println("---- This is the Before Each method");
    }

    @AfterAll
    void afterAll(){
        System.out.println("--This is the After All method");
    }

    @AfterEach
    void afterEach(){
        System.out.println("---- This is the After Each method");
    }

    @Test
    void firstMethod(){
        System.out.println("This is the first test method");
    }

    @Test
    @DisplayName("US1234 - TC12 - this method is the second one")
    void secondMethod(){
        System.out.println("This the second test method");
    }
}*/

/*
// This is for Test Automation University Module JUnit Chapter 4: Parameterized Tests with @ValueSource
package JUnit5Tests;

import org.junit.jupiter.api.*;

@TestInstance(TestInstance.Lifecycle.PER_CLASS) // We use this annotation to we don't have to mark each of the setup and cleanup methods as static
public class FirstTestClass {

    @BeforeAll
    void beforeAll(){
        System.out.println("-- This is the Before All method");
    }

    @BeforeEach
    void beforeEach(){
        System.out.println("---- This is the Before Each method");
    }

    @AfterAll
    void afterAll(){
        System.out.println("--This is the After All method");
    }

    @AfterEach
    void afterEach(){
        System.out.println("---- This is the After Each method");
    }

    @Test
    void firstMethod(){
        System.out.println("This is the first test method");
    }

    @Test
    @DisplayName("US1234 - TC12 - this method is the second one")
    void secondMethod(){
        System.out.println("This the second test method");
    }
}*/

// This is for Test Automation University Module JUnit Chapter 4: Parameterized Tests with @ValueSource
/*package JUnit5Tests;

 *//*import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.NullAndEmptySource;
import org.junit.jupiter.params.provider.ValueSource;*//*

import org.junit.jupiter.params.provider.*;
import org.junit.jupiter.params.*;

public class ParameterizedTests {

    @ParameterizedTest(name = "Run: {index} - value: {arguments}")
    @ValueSource(ints = {1,5,6})
    void intValues(int theParam){
        System.out.println("theParam = " + theParam);
    }

    @ParameterizedTest
    @NullAndEmptySource // These will be our first two parameters (null comes first, then empty string)
    @ValueSource(strings = {"firstString", "secondString"})
    void stringValues(String theParam){
        System.out.println("theParam = " + theParam);
    }
}*/


/*// This is for Test Automation University Module JUnit Chapter 5: Parameterized Tests with @CsvSource
package JUnit5Tests;

import org.junit.jupiter.params.provider.*;
import org.junit.jupiter.params.*;

public class ParameterizedTests {

    @ParameterizedTest
    @CsvSource(value = {"steve, rogers", "captain, marvel", "bucky, barnes"})
    void csvSource_StringString(String param1, String param2){
        System.out.println("param1= " + param1 + ", param2 = " + param2);
    }

    @ParameterizedTest
    @CsvSource(value = {"steve, 32, true", "captain, 21, false", "bucky, 5, true"})
    void csvSource_StringIntBoolean(String param1, int param2, boolean param3){
        System.out.println("param1 = " + param1 + ", param2 = " + param2 + ", param3 = " + param3);
    }

    // Here the strings contain the comma character as part of the string
    // Essentially our comma is not our delimeter - when inside single quotes
    @ParameterizedTest
    @CsvSource(value = {"captain america, 'steve, rogers'", "winter soldier," + "'bucky, barnes'" })
    void csvSource_StringWithComa(String param1, String param2){
        System.out.println("param1 = " + param1 + ", param2 = " + param2);
    }

    // Here our delimiter (inside the string) is a question mark not a comma
    @ParameterizedTest
    @CsvSource(value = {"steve?rogers", "bucky?barnes"}, delimiter = '?')
    void csvSource_StringWithDiffDelimiter(String param1, String param2){
        System.out.println("param1 = " + param1 + ", param2 = " + param2);
    }
}*/

/*// This is for Test Automation University Module JUnit Chapter 6: Parameterized Tests with @CsvFileSource
package JUnit5Tests;

import org.junit.jupiter.params.provider.*;
import org.junit.jupiter.params.*;

public class ParameterizedTests {
    // This is how we run multiple files
    @ParameterizedTest
    @CsvFileSource(files = {"src/test/resources/params/shoppinglist.csv", "src/test/resources/params/shoppinglist2.csv"}, numLinesToSkip = 1)
    void csvFileSource_StringDoubleIntStringString(String name, double price, int qty, String uom, String provider) {
        System.out.println("name = " + name + ", price = " + price + ", qty = " + qty + ", uom = " + uom + ", provider = " + provider);;
    }

    // If our delimiter is not a comma, we give the delimiter or delimiterString attribute
    @ParameterizedTest
    @CsvFileSource(files = "src/test/resources/params/shoppinglist3.csv", numLinesToSkip = 1, delimiterString = "___")
    void csvFileSource_StringDoubleIntStringStringSpecifiedDelimiter(String name, double price, int qty, String uom, String provider) {
        System.out.println("name = " + name + ", price = " + price + ", qty = " + qty + ", uom = " + uom + ", provider = " + provider);
    }

    @ParameterizedTest
    @CsvFileSource(files = "src/test/resources/params/shoppinglist4.csv", numLinesToSkip = 1, delimiterString = "___")
    void csvFileSouceNullandEmptyValues(String name, double price, int qty, String uom, String provider) {
        System.out.println("name = " + name + ", price = " + price + ", qty = " + qty + ", uom = " + uom + ", provider = " + provider);
    }

    // This is with the Chamberlain BigQuery file - Just for practice
    @ParameterizedTest
    @CsvFileSource(files = "src/test/resources/params/bquxjob_6ddfd0be_1889d8a79a8.csv", numLinesToSkip = 1)
    void analytics(String event,String itemName, String itemCategory,
                   String screenName, String name, String sessionID, String myqGroupID,
                   String errorCode, String timeChicago, String dateChicago,
                   String phoneModel, String osVersion, String version, String user_id){
        System.out.println("event = " + event + ", itemName = " + itemName +
                ", itemCategory = " + itemCategory + ", screenName = " + screenName +
                ", name = " + name + ", sessionID = " + sessionID + ", myqGroupID = "
                + myqGroupID + ", errorCode = " + errorCode + ", timeChicago = " +
                timeChicago + ", dateChicago = " + dateChicago + ", phoneModel = "
                + phoneModel + ", osVersion = " + osVersion + ", version = " +
                version + ", user_id = " + user_id);
    }
}*/

/*
// This is for Test Automation University Module JUnit Chapter 7: Parameterized Tests with @MethodSource
package JUnit5Tests;

import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.params.provider.*;
import org.junit.jupiter.params.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

import static org.junit.jupiter.params.provider.Arguments.arguments;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class ParameterizedTests {

    @ParameterizedTest
    @MethodSource(value = "sourceString")
    void methodSource_String(String param1) {
        System.out.println("param1 = " + param1);
    }

    @ParameterizedTest
    @MethodSource(value = "sourceStringAsStream")
    void methodSource_StringStream(String param1) {
        System.out.println("param1 = " + param1);
    }

    @ParameterizedTest
    @MethodSource(value = "sourceList_StringDouble")
    void methodSource_StringDoubleList(String param1, double param2) {
        System.out.println("param1 = " + param1 + ", param2 = " + param2);
    }

    // This is for utilizing Java code outside of this class, we need to specify the path inside @MethodSource
    @ParameterizedTest
    @MethodSource(value = "JUnit5Tests.ParamProvider#sourceStream_StringDouble")
    void methodSource_StringDoubleStream(String param1, double param2) {
        System.out.println("param1 = " + param1 + ", param2 = " + param2);
    }


    List<String> sourceString() {
        // processing done here
        return Arrays.asList("tomato", "carrot", "cabbage");
    }

    Stream<String> sourceStringAsStream() {
        return Stream.of("beetroot", "apple", "pear");
    }

    List<Arguments> sourceList_StringDouble() {
        // processing
        return Arrays.asList(arguments("tomato", 2.0), arguments("carrot", 4.5),
                arguments("cabbage", 7.8));
    }
}*/

/*// This is for Test Automation University Module JUnit Chapter 8: Test Run Order
package JUnit5Tests;

import org.junit.jupiter.api.*;

import org.junit.jupiter.params.provider.*;
import org.junit.jupiter.params.*;

// This annotation is to tell JUnit that the tests will run in alphanumeric order based on their method names
@TestMethodOrder(MethodOrderer.MethodName.class)

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class ParameterizedTests {

    @BeforeAll
    void beforeAll(){
        System.out.println("-- This is the Before All method");
    }

    @BeforeEach
    void beforeEach(){
        System.out.println("---- This is the Before Each method");
    }

    @AfterAll
    void afterAll(){
        System.out.println("--This is the After All method");
    }

    @AfterEach
    void afterEach(){
        System.out.println("---- This is the After Each method");
    }

    @Test
    void firstMethod(){
        System.out.println("This is the first test method");
    }

    @Test
    @DisplayName("US1234 - TC12 - this method is the second one")
    void secondMethod(){
        System.out.println("This the second test method");
    }

    @Test
    @DisplayName("A display name")
    void thirdTest() {
        System.out.println("This is the third test method");
    }
}*/

/*// This is for Test Automation University Module JUnit Chapter 8: Test Run Order
// This example is slightly different. This is not a duplicate
package JUnit5Tests;

import org.junit.jupiter.api.*;

// This annotation is to tell JUnit to give a numerical order to our test methods
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class ParameterizedTests {

    @BeforeAll
    void beforeAll(){
        System.out.println("-- This is the Before All method");
    }

    @BeforeEach
    void beforeEach(){
        System.out.println("---- This is the Before Each method");
    }

    @AfterAll
    void afterAll(){
        System.out.println("--This is the After All method");
    }

    @AfterEach
    void afterEach(){
        System.out.println("---- This is the After Each method");
    }

    @Test
    @Order(2)
    void firstMethod(){
        System.out.println("This is the first test method");
    }

    @Test
    @DisplayName("US1234 - TC12 - this method is the second one")
    void secondMethod(){
        System.out.println("This the second test method");
    }

    @Test
    @Order(1)
    void thirdTest() {
        System.out.println("This is the third test method");
    }
}*/

/*
package JUnit5Tests;

import org.junit.jupiter.params.provider.*;
import org.junit.jupiter.params.*;

import static org.junit.jupiter.api.Assumptions.*;

public class ParameterizedTests {

    @ParameterizedTest(name = "Run: {index} - value: {arguments}")
    @ValueSource(ints = {1,5,6})
    void intValues(int theParam){
        assumeTrue(theParam > 4); // If the condition is True, the test will run else it is ignored
        System.out.println("theParam = " + theParam);
    }

    @ParameterizedTest
    @CsvSource(value = {"steve, rogers", "captain, marvel", "bucky, barnes"})
    void csvSource_StringString(String param1, String param2){
        assumeFalse(param1.equals("steve"), "The assumption failed for the following param2: " + param2 );
        // If out assumption fails, we want to print this message to the console
        // We don't want param1 to be steve
        System.out.println("param1= " + param1 + ", param2 = " + param2);
    }

    @ParameterizedTest
    @CsvSource(value = {"steve, 32, true", "captain, 21, false", "bucky, 5, true"})
    void csvSource_StringIntBoolean(String param1, int param2, boolean param3){
        assumingThat(param2 > 20, () -> System.out.println("This code ran"));
        // Executes when we know our param2 (int value) is grater than 20
        // The rest of the test will run, the assumption is independent of the rest of the code
        System.out.println("param1 = " + param1 + ", param2 = " + param2 + ", param3 = " + param3);
    }
}*/

/*
// This is for Test Automation University Module JUnit Chapter 11: Repeating Tests
package JUnit5Tests;
import org.junit.jupiter.api.*;

public class ParameterizedTests {

    @RepeatedTest(5)
    void firstRepeatedMethod(){
        System.out.println("We are repeating this test");
    }

    @DisplayName("This is a repeated test method")
    @RepeatedTest(value = 3, name = "Running repetition :{currentRepetition}." +
            "Total is: {totalRepetitions}" )
    void secondRepeatMethod(){
        System.out.println("We are repeating a new test");
    }

    @RepeatedTest(3)
    void thirdRepeatedMethod(RepetitionInfo repetitionInfo){
        System.out.println("This code will run at each repetition");
        Assumptions.assumingThat(repetitionInfo.getCurrentRepetition() == 3, () ->
        System.out.println("This code only runs for repetition" + "3"));
    }

}*/

/*// This is for Test Automation University Module JUnit Chapter 12: Tags
package JUnit5Tests;

import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

@TestInstance(TestInstance.Lifecycle.PER_CLASS) // We use this annotation to we don't have to mark each of the setup and cleanup methods as static
public class ParameterizedTests {

    @BeforeAll
    void beforeAll() {
        System.out.println("-- This is the Before All method");
    }

    @BeforeEach
    void beforeEach() {
        System.out.println("---- This is the Before Each method");
    }

    @AfterAll
    void afterAll() {
        System.out.println("--This is the After All method");
    }

    @AfterEach
    void afterEach() {
        System.out.println("---- This is the After Each method");
    }

    @Test
    @Tag("sanity")
    void firstMethod() {
        System.out.println("This is the first test method");
    }

    @Test
    @Tag("sanity")
    @Tag("acceptance")
    @DisplayName("US1234 - TC12 - this method is the second one")
    void secondMethod() {
        System.out.println("This the second test method");
    }

    @Test
    @Tag("acceptance")
    void thirdMethod(){
        System.out.println("This is the third test method");
    }

    @Tag("acceptance")
    @ParameterizedTest(name = "Run: {index} - value: {arguments}")
    @ValueSource(ints = {1,5,6})
    void intValues(int theParam){
        System.out.println("theParam = " + theParam);
    }
}*/


/*// This is for Test Automation University Module JUnit Chapter 13: Assertions
package JUnit5Tests;

import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class ParameterizedTests {
    @Test
    void asserEqualsTest(){
        assertEquals("firstString", "secondString", "The String values were not equal");
    }

    @Test
    void assertEqualsListTest(){
        List<String> expecptedValues = Arrays.asList("firstString", "secondString", "thirdString");
        List<String> actualValues = Arrays.asList("firstString", "secondString");
        assertEquals(expecptedValues, actualValues);
    }

    @Test
    void assertArraysEqualTest(){
        int[] excpectedValues = {1,5,3};
        int[] actualValues = {1,2,3};
        assertArrayEquals(excpectedValues, actualValues);
    }

    // assertTrue is very popular
    @Test
    void assertTrueTest(){
        assertFalse(false,"This condition evaluated to false");
        assertTrue(false, "This boolean condition did not evaluate to true");
    }

    @Test
    void assertThrowsTest(){
        assertThrows(NullPointerException.class, null);
    }

    // This is basically saying that even though you have several assertions in one test method
    // Let's say one of the first ones fail, you still want all of the assertions to be evaluated.
    @Test
    void assertAllTest(){
        assertAll(
                () -> assertEquals("firstString", "secondString", "The String" + "values were not equal"),
                () -> assertThrows(NullPointerException.class, null), // This one will pass while the other two will fail
                () -> assertTrue(false, "This boolean condition did not evaluate to ture")
        );
    }
}*/

/*// This is for Test Automation University Module JUnit Chapter 14: Hamcrest
package JUnit5Tests;

import org.hamcrest.Matchers;
import org.junit.jupiter.api.Test;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import static java.util.Arrays.asList;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsInAnyOrder;
import static org.hamcrest.Matchers.hasItem;

public class ParameterizedTests {

    @Test
    void assertForMapTest() {
        Map<String, Integer> theMap = new HashMap<>();
        theMap.put("firstKey", 1);
        theMap.put("secondKey", 2);
        theMap.put("thirdKey", 3);

        assertThat(theMap, Matchers.hasValue(22));
        assertThat(theMap, Matchers.hasKey("secondKey1"));
    }

    @Test
    void assertForList() {
        List<String> theList = asList("firstString", "secondString", "thirdString");
        assertThat(theList, hasItem("thirdString"));
    }

    @Test
    void assertForAnyOf() {
        List<String> theList = asList("firstString", "secondString", "thirdString");
        assertThat(theList, Matchers.anyOf(hasItem("thirdString"), hasItem("noString")));

        assertThat(theList, Matchers.allOf(hasItem("thirdString"), hasItem("noString")));
    }

    @Test
    void assertForContainsAnyOrder() {
        List<String> theList = asList("firstString", "secondString", "thirdString");
        assertThat(theList, containsInAnyOrder("firstString", "thirdString", "secondString"));
    }
}*/

// This is for Test Automation University Module JUnit Chapter 15: Running Tests


