/*
// Problem 5 Java Inheritance: Write a Java program to create a class known as "BankAccount"
// with methods called deposit() and withdraw().
// Create a subclass called SavingsAccount that overrides the withdraw() method to prevent withdrawals
// if the account balance falls below one hundred.
public class SavingsAccount extends BankAccount{

    // Override the withdraw method
    @Override
    public double withdraw(double withdraw){
        if (this.amount - withdraw < 100.00){ // If the balance is below $100
            System.out.println("You can't withdraw from an account with an amount balance less than $100");
        }
        // Return the balance
        System.out.print("Below is your current balance after the deposit: ");
        return this.amount;
    }
}
*/
