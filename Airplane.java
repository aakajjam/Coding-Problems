/*// Problem 12 Java OOPs: Write a Java program to create a class called "Airplane"
// with a flight number, destination, and departure time attributes,
// and methods to check flight status and delay.

// Import flight utilities
import java.time.LocalTime;
import java.time.chrono.ChronoLocalDateTime;

// Create the Airplane Class
public class Airplane {

    // Create attributes flight number (int), destination (String), departure time (LocalTime)
    int flightNumber;
    String destination;
    LocalTime localTime = LocalTime.now();

    public Airplane(){
    }

    // Method for the flight number
    public int getFlightNumber(int confirmationNumber){
        return flightNumber = confirmationNumber;
    }

    // Method for the destination
    public String getDestination(String location){
        return destination = location;
    }

    // Create flight status method
    public String flightStatus(String flightStatus){
        return flightStatus;
    }

}*/
