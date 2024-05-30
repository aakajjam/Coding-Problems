/*// Test Automation University - Example Problem Chapter 9a - Inheritance
public class Employee extends Person{

    private String employeeId;
    private String title;

    // Define a constructor
    public Employee(){
        super("Akshay");
        System.out.println("This is Employee default constructor");
    }

    public String getEmployeeId(){
        return employeeId;
    }

    public void setEmployeeId(String employeeId){
        this.employeeId = employeeId;
    }

    public String getTitle(){
        return title;
    }

    public void setTitle(String title){
        this.title = title;
    }

}*/

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*//Write a Java program to create a class called "Employee" with a name, job title, and salary attributes,
//and methods to calculate and update salary.

public class Employee {

    String name;
    String jobTitle;
    int salary = 0;

    public Employee(){
    }

    // Create a method to get the job title
    public String getJobTitle(String jobTitle){
        return this.jobTitle = jobTitle;
    }

    // Create a method to get the name
    public String getName(String name){
        return this.name = name;
    }

    // Create a method to calculate the salary
    public int getSalary(int salary){
            return this.salary = salary * 1000;
    }

    // Create a method to update the salary
    public int updateSalary(){
        return this.salary * 2;
        // If we gave an input in the getSalary method, then the value of this.salary * 2 will update the value from the getSalary method
    }
}*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*// Problem 4 Java Inheritance: Write a Java program to create a class called Employee with methods called work() and getSalary().
// Create a subclass called HRManager that overrides the work() method and adds a new method called addEmployee().
public class Employee {

    public int salary = 0;

    public Employee(){
        System.out.println(salary);
    }

    public Employee(int salary){
       this.salary = salary;
    }

    public String work(){
        return "Unknown Job";
    }

    public int getSalary(int salary){
        return this.salary = salary;
    }
}*/

/*
// Problem 7 Java Inheritance: Write a Java program to create a class known as Person with methods called getFirstName() and getLastName().
// Create a subclass called Employee that adds a new method named getEmployeeId() and overrides the getLastName()
// method to include the employee's job title.
public class Employee extends Person{

    public String jobTitle = "Plasma Physicist";

    public String getEmployeeId(String employeeId){
        return employeeId;
    }

    @Override
    public String getLastName(){
        return super.getLastName() + jobTitle;
        // The super.getLastName allows you to inherit the method from the parent class
    }
}
*/

