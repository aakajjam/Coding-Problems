/*// Write a Java program to create a class called "Student" with a name, grade, and courses attributes,
// and methods to add and remove courses.
import java.util.ArrayList;
public class Student {

    //String name;
    //char grade;
    ArrayList<String> courses = new ArrayList<>(); // Define a global variable with an arrayList

    // Create the Student class constructor
    public Student(){
       // name;
       // grade;
    }

    // Get the student name
    public String getName(String name){
        return name;
    }

    // Get the student grade
    public char getGrade(char grade){
        return grade;
    }

    // Add their courses
    public ArrayList<String> addCourse(String courseName, String secondCourse, String thirdCourse, String fourthCourse){
        ArrayList<String> elective = new ArrayList<String>();
        elective.add(courseName);
        elective.add(secondCourse);
        elective.add(thirdCourse);
        elective.add(fourthCourse);
        courses = elective; // Save added courses to the globally defined courses
        return courses;
    }

    // Remove their courses
    public ArrayList<String> deleteCourses(int courseNumber){ // Give a number
        if (courses == null){ // Use the globally defined courses
            System.out.print("Nothing is removed since the arrayList is empty");
        }
        else{
            courses.remove(courseNumber);
        }
        return courses;
    }

}*/
