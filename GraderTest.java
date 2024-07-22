/*
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class GraderTest {

    Grader grader = new Grader();

    @Test
    void fiftyNineShouldReturnF(){
        assertEquals('F', grader.determineLetterGrade(59));
    }

    @Test
    void sixtyNineShouldReturnD(){
        assertEquals('D', grader.determineLetterGrade(69));
    }

    @Test
    void seventyNineShouldReturnC(){
        assertEquals('C', grader.determineLetterGrade(79));
    }

    @Test
    void eightyNineShouldReturnB() {
        assertEquals('B', grader.determineLetterGrade(89));
    }

    @Test
    void ninetyNineShouldReturnA() {
        assertEquals('A', grader.determineLetterGrade(99));
    }

    @Test
    void eightyShouldReturnB(){
        assertEquals('B', grader.determineLetterGrade(80));
    }

    @Test
    void ninetyShouldReturnA(){
        assertEquals('A', grader.determineLetterGrade(90));
    }

    @Test
    void seventyShouldReturnC(){
        assertEquals('C', grader.determineLetterGrade(70));
    }

    @Test
    void sixtyShouldReturnD(){
        assertEquals('D', grader.determineLetterGrade(60));
    }

    @Test
    void zeroShouldReturnF(){
        assertEquals('F', grader.determineLetterGrade(0));
    }

    @Test
    void negativeOneShouldReturnIllegalArgumentException(){
        assertThrows(IllegalArgumentException.class, () -> {grader.determineLetterGrade(-1);});
    }

}*/

// Another way to do the grader
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import static org.junit.jupiter.api.Assertions.*;

class GraderTest {

    Grader grader = new Grader();

    @Test
    void belowSixtyShouldReturnF(){
        for (int i = 0; i < 60; i++){
            assertEquals('F', grader.determineLetterGrade(i));
        }
    }

    @ParameterizedTest
    @ValueSource(ints = {60,61,62,63,64,65,66,67,68,69})
    void sixtiesShouldReturnD(int numberGrade) {
        assertEquals('D', grader.determineLetterGrade(numberGrade));
    }

    @ParameterizedTest
    @ValueSource(ints = {70,71,72,73,74,75,76,77,78,79})
    void seventiesShouldReturnC(int numberGrade) {
        assertEquals('C', grader.determineLetterGrade(numberGrade));
    }

    @ParameterizedTest
    @ValueSource(ints = {80,81,82,83,84,85,86,87,88,89})
    void eightiesShouldReturnB(int numberGrade) {
        assertEquals('B', grader.determineLetterGrade(numberGrade));
    }

    @ParameterizedTest
    @ValueSource(ints = {90,91,92,93,94,95,96,97,98,99,100})
    void ninetiesShouldReturnA(int numberGrade) {
        assertEquals('A', grader.determineLetterGrade(numberGrade));
    }
}


