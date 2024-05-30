/*
// Problem 4 Java Inheritance: Write a Java program to create a class called Employee with methods called work() and getSalary().
// Create a subclass called HRManager that overrides the work() method and adds a new method called addEmployee().
import java.util.ArrayList;
public class HRManager extends Employee {

    // Create a global variable for the occupation
    public String occupation = "HR Manager";

    // Create an ArrayList which can be used globally
    ArrayList<String> workers = new ArrayList<String>();

    // Create the HR Manager constructor to utilize the super keyword
    public HRManager(){
        super(50000); // User the super keyword and give the salary to utilize the other constructor in the parent class
        // Give the salary which is already setup in the Employee class (parent class)
    }

    // Override the work method and return the occupation of the HR Manager
    @Override
    public String work(){
        return occupation;
    }

    // Create an ArrayList method to take String names and return an ArrayList
    public ArrayList addEmployee(String name){
       workers.add(name);
       return workers;
    }

}
*/
