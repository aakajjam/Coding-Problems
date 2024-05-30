/*
// Problem 1 Java OOPs Exercises:
public class Java_OOPs {
        public static void main(String args[]){

            // Create an instance of a class using the default constructor
            Person person = new Person();

            // Print their name and age - Using a constructor with default variables
            System.out.println(person.name);
            System.out.println(person.age);

            // Create an instance of a class by inputting the parameters age and name
            Person human = new Person(11, "Rahul");

            // Print their name age - Using a constructor where you give the name and age
            System.out.println(human.name);
            System.out.println(human.age);

            // You can overwrite the values
            human.name = "Sheldon";
            human.age = 45;

            System.out.print(human.name);
            System.out.print(human.age);

        }
}*/

/*// Problem 2 Java OOPs:  Write a Java program to create a class called "Dog" with a name and breed attribute.
// Create two instances of the "Dog" class, set their attributes using the constructor and modify the attributes using the setter methods
// and print the updated values.
public class Java_OOPs {
    public static void main(String args[]){

        // Create an instance of the Dog class
        Dog canine = new Dog();

        // Print out the attributes of the Dog class constructor - just for reference
        System.out.println(canine.breed);
        System.out.println(canine.name);

        // Print out the modified name and breed by calling on the class methods
        System.out.println(canine.setBreed());
        System.out.println(canine.setName());
    }
}*/


/*// Problem 4 Java OOPs: Write a Java program to create a class called "Circle" with a radius attribute.
// You can access and modify this attribute.
// Calculate the area and circumference of the circle.
public class Java_OOPs{
    public static void main(String args[]){

        // Create an instance of class circle
        Circle orbit = new Circle();

        // Print out the attribute (which we called radius) of the constructor circle - just for reference
        System.out.println("This is the value of the attribute in the constructor: " + orbit.radius);

        // Calculate the area of the circle by modifying the radius (which is being done by our setter method areaCircle)
        double myArea = orbit.areaCircle(10.0); // We modified by giving raduis of 10.0
        System.out.println("This is the area of the circle: " + myArea);

        // Calculate the circumference by simply accessing the attribute radius in the class
        double myCircumfrencerence = orbit.circumfrenceCircle();
        System.out.printf("This is the circumference of the circle %.1f %n ", myCircumfrencerence);
    }
}*/

/*// Problem 6 Java OOPs: Write a Java program to create a class called
// "Employee" with a name, job title, and salary attributes, and methods to calculate and update salary.
public class Java_OOPs {
    public static void main(String args[]){

        // Create an instance of the class
        Employee worker = new Employee();

        // Call on the job title method, give the input and print
        System.out.print(worker.getJobTitle("Software Tester"));

        // Call on the salary method, give the input and print
        System.out.println(worker.getSalary(1000));

        // Call on the update salary method and print - This will update the salary that we gave in the getSalary method or give the default
        // If we did not call on the getSalary method
        System.out.println(worker.updateSalary());

    }
}*/


/*// Problem 10 OOPs: Write a Java program to create a class called "Student" with a name, grade,
// and courses attributes, and methods to add and remove courses.
import java.util.ArrayList;
public class Java_OOPs {
    public static void main(String args[]){

        // Create an instance of Student class
        Student kids = new Student();

        // Call on the getName function
        String kidsName = kids.getName("Sheldon Cooper");
        System.out.println(kidsName);

        // Call on the addCourse method and give the string inputs
        // Save to a variable of type ArrayList<String>
        ArrayList<String> elective = kids.addCourse("Theoretical Physics", "Dark Matter",
                "Quantum Physics", "M-Theory");

        System.out.println(elective);
    }
}*/

// Problem 12 Java OOPs: Write a Java program to create a class called
// "Airplane" with a flight number, destination, and departure time attributes,
// and methods to check flight status and delay.

// Import flight utilities

// Create the Airplane Class

// Create attributes flight number (int), destination (String), departure time (LocalTime)

// Create flight status method

// Create method for a delay - this could go within the flight status method

////////////////////////////////////////////////////////////////////////////////////////////////////////


/*// Inheritance Practice Problem Test Automation University Chapter 9a - Inheritance
public class Java_OOPs {
    public static void main(String args[]){

        // Creating an instance of the parent class
        Person person = new Person();

        // Creating an instance of the child class (inherited from parent)
        Employee employee = new Employee();

    }
}*/

/*// Inheritance Practice Problem Test Automation University Chapter 9b - Constructors in Inheritance
public class Java_OOPs {
    public static void main(String args[]){

        // Creating an instance of the child class
        Employee employee = new Employee(); // This will call on the code inside the Person (parent class) and Employee (child class)
    }
}*/

/*// Inheritance Practice Problem TEst Automation University Chapter 9c - Overriding and Overloading Methods
public class Java_OOPs {
    public static void main(String args[]){

        // Create an instance of the parent class
        Rectangle rectangle = new Rectangle();
        rectangle.print();

        // Create an instance of the child class
        Square square = new Square();
        square.print(); // This is from the parent class
        square.print("Square"); // Method we overloaded in the child class

    }
}*/

/*// Problem 1 Java Inheritance: Write a Java program to create a class called Animal with a method called makeSound().
// Create a subclass called Cat that overrides the makeSound method to bark
public class Java_OOPs {
    public static void main(String args[]){

        // Create an instance of the parent class - This is just for reference
        Animal animal = new Animal();

        // Print out the animal sound using the makeSound method - This is also just for reference
        System.out.println(animal.makeSound());

        // Create an instance of the child class
        Cat kitten = new Cat();

        // Print out the meow sound for a cat using the overridden makeSound method
        System.out.println(kitten.makeSound());
    }
}*/

/*// Problem 2 Java Inheritance: Write a Java program to create a class called Vehicle with a method called drive().
// Create a subclass called Car that overrides the drive() method to print "Repairing a car".
public class Java_OOPs {
    public static void main(String args[]){

        // Create an instance of the parent class - Just for reference
        Vehicle vehicle = new Vehicle();

        // Call on the drive method from the Vehicle class - Also just for reference
        vehicle.drive();

        // Create an instance of the child class
        Car car = new Car();

        // Call on the overridden method drive
        car.drive();
    }
}*/

/*// Problem 3 Java Inheritance: Write a Java program to create a class called Shape with a method called getArea().
// Create a subclass called Rectangle that overrides the getArea() method to calculate the area of a rectangle.
public class Java_OOPs {
    public static void main(String args[]){

        // Create an instance of the parent class Shape - This is just for reference
        Shape shape = new Shape();

        // Call on the ShapeArea method - Also just for reference
        System.out.println(shape.ShapeArea());

        // Create an instance of the child class - Give values for the Rectangle constructor
        Rectangle rectangle  = new Rectangle(5.0, 10.0);

        // Call on the ShapeArea method which was overridden in the Rectangle class
        System.out.println("This is the area of a rectangle: " + rectangle.ShapeArea());
    }
}*/


/*// Problem 4 Java Inheritance: Write a Java program to create a class called Employee with methods called work() and getSalary().
// Create a subclass called HRManager that overrides the work() method and adds a new method called addEmployee().
public class Java_OOPs {
    public static void main(String args[]){

        // Create an instance of the child class (HRManager)
        HRManager hrManager = new HRManager();

        // Get the HR Manager's occupation by calling on the overridden work method
        System.out.println("This is the HR Manager's occupation: " + hrManager.work());

        // Get the HR Manager's salary by calling on the getSalary method and providing an integer
        System.out.println("This is the HR Manager's salary: " + hrManager.getSalary(50000));

        // Get name added to the ArrayList by calling on the addEmployee method
        System.out.println("Adding a new name to the ArrayList: " + hrManager.addEmployee("Rajesh Koothrapalli"));

        // Create an instance of the parent class (Employee) and call on the default constructor - Just for reference
        System.out.print("This is the Employee default salary: ");
        Employee employee = new Employee();
    }
}*/

/*// Problem 5 Java Inheritance: Write a Java program to create a class known as "BankAccount" with methods called deposit() and withdraw().
// Create a subclass called SavingsAccount that overrides the withdraw() method to prevent withdrawals
// if the account balance falls below one hundred.
public class Java_OOPs {
    public static void main(String args[]){

        // Create an instance of the child class
        SavingsAccount savingsAccount = new SavingsAccount();

        // Deposit some money into the savings account by calling on the deposit method
        System.out.println("This is the money I deposited in the Savings Account: " + savingsAccount.deposit(1000.00));

        // Withdraw money from the account by calling on the withdraw method - where the balance will be less than $100
        System.out.println(savingsAccount.withdraw(950.00));

        // Print out the current balance
        System.out.print("This is your current balance: " + savingsAccount.amount);
    }
}*/

/*
// Problem 6 Java Inheritance: Write a Java program to create a class called Animal with a method named move().
// Create a subclass called Cheetah that overrides the move() method to run.
public class Java_OOPs {
    public static void main(String args[]){

        // Create an instance of the parent class - Just for reference
        Animal animal = new Animal();
        System.out.println(animal.move());

        // Create an instance of the child class
        Cheetah cheetah = new Cheetah();
        System.out.println(cheetah.move());
    }
}*/

/*
// Problem 7 Java Inheritance: Write a Java program to create a class known as Person with methods called getFirstName() and getLastName().
// Create a subclass called Employee that adds a new method named getEmployeeId() and overrides the getLastName()
// method to include the employee's job title.
public class Java_OOPs {
    public static void main(String args[]){

        // Create an instance of the Employee class
        Employee employee = new Employee();

        // Get the Employee first name
        System.out.println(employee.getFirstName());

        // Get the Employee last name
        System.out.println(employee.getLastName());
    }
}
*/

/*
// Problem 8 Java Inheritance: Write a Java program to create a class called Shape with methods called getPerimeter() and getArea().
// Create a subclass called Circle that overrides the getPerimeter() and getArea() methods to calculate the area and perimeter of a circle.
public class Java_OOPs {
    public static void main(String args[]){

        // Create an instance of the Circle child class
        Circle circle = new Circle(100.0);

        // Get the perimeter of the circle by calling on the getPerimeter method
        System.out.println("This is the perimeter of the circle: " + circle.getPerimeter());

        // Get the area of the circle by calling on the getArea method
        System.out.println("This is the area of the circle: " + circle.getArea());

    }

}*/

/*
// Problem 9 Java Inheritance: Write a Java program to create a vehicle class hierarchy.
// The base class should be Vehicle, with subclasses Truck, Car and Motorcycle.
// Each subclass should have properties such as make, model, year, and fuel type.
// Implement methods for calculating fuel efficiency, distance traveled, and maximum speed.
public class Java_OOPs {
    public static void main(String args[]){
        Car car = new Car("Chevy", "Camaro", "Regular", 2024);
        System.out.print(car);
        car.maxSpeed(20);
        car.distanceTravelled(20, 10);
    }
}*/

/*
// Test Automation University Example Problem - Chapter 9d Access Limitations and Multiple Inheritance
public class Java_OOPs {
    public static void main(String args[]){
        Mother mother = new Mother();
        System.out.print(mother.getAge(5));
        // Woman is a parent class to Mother
        // But Woman is a child class to Person
        // Therefore Woman is a child class to Person

    }
}*/

/*// Test Automation University Example Problem - Chapter 10 Polymorphism
public class Java_OOPs { // In the example problem class name is Zoo
    public static void main(String args[]){

        Dog rocky = new Dog();
        rocky.fetch(); // Fetch is fun
        rocky.makeSound(); // Woof
        feed(rocky); // Here is your dog food

        Animal sasha = new Dog(); // sasha is a type of Animal called Dog
        sasha.makeSound(); // Woof
        feed(sasha); // Here is your dog food

        sasha = new Cat(); // sasha is a type of Animal called Cat
        sasha.makeSound(); // Meow
        ((Cat) sasha).scratch(); // I am a cat. I scratch things
        feed(sasha); // Here is your cat food.
    }

    public static void feed(Animal animal){
        if (animal instanceof Dog){
            System.out.println("Here is your dog food");
        }
        else if (animal instanceof Cat) {
            System.out.println("Here is your cat food");

        }
    }
}*/

/*// Fruit Market
public class Java_OOPs {
    public static void main(String args[]){

        Fruit myFruit = new Apple(); // Creating an instance of Apple
        myFruit.setCalories(500); // This will set the calories of the apple to 400
        myFruit.makeJuice(); // This will give apple cider
        ((Apple)myFruit).removeSeeds(); // Remove the seeds of the apple

        // Subsequent operations on myFruit do not retain the type casting (Apple),
        // Thus myFruit behaves according to its actual type (Fruit).

        myFruit = new Banana(); // Creating an instance of Banana - reassigning the myFruit reference to new Banana instance
        myFruit.setCalories(500); // This will set the calories of the banana to 500
        myFruit.makeJuice(); // This will give banana smoothie
        ((Banana)myFruit).peelSkin(); // Peel the banana skin fruit

// This will fail because myFruit first references Banana but then shifts the myFruit reference to Apple
// That fails because Banana and Apple are not connected to each other and therefore need to go back up to Fruit type before being cast again as a different reference type
        ((Banana)myFruit).peelSkin();
        ((Apple)myFruit).removeSeeds();
    }
}*/

