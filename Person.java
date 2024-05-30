/*// Test Automation University - Example Problem Chapter 9a - Inheritance
public class Person {

    private String name;
    private int age;
    private String gender;

    public Person(){
        System.out.println("This is the Person default constructor");
    }

    public Person(String name){
        System.out.println("This is the Person 2nd constructor. Name is set");
    }

    public String getName(){
        return name;
    }

    public String setName(String name){
        return this.name = name;
    }

    public int getAge(){
        return age;
    }

    public int setAge(int age){
        return this.age = age;
    }

    public String getGender(){
        return gender;
    }

    public String setGender(String gender){
        return this.gender = gender;
    }
}*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*// Problem 1: Write a Java program to create a class called "Person" with a name and age attribute.
// Create two instances of the "Person" class, set their attributes using the constructor, and print their name and age.
public class Person {
    public String name;
    public int age;

    // Create a constructor - default
    public Person(){
        name = "Akshay";
        age = 10;

        }
    public Person(int age, String name){
        this.age = age;
        this.name = name;

    }

}*/

/*
// Problem 7 Java Inheritance: Write a Java program to create a class known as Person with methods called getFirstName() and getLastName().
// Create a subclass called Employee that adds a new method named getEmployeeId()
// and overrides the getLastName() method to include the employee's job title.
public class Person {

    // Create firstName variable
    public String firstName = "Barry";

    // Create lastName variable
    public String lastName = "Kripke";

    // Create method getFirstName
    public String getFirstName(){
        return firstName;
    }

    // Create method getLastName
    public String getLastName(){
        return lastName;
    }
}*/

/*
// Test Automation University Example Problem - Chapter 9d Access Limitations and Multiple Inheritance
public class Person {

    private String name;
    private int age;
    private String gender;

    private String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge(int num) {
        return this.age = num;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

}*/
