// Design an Employee type with details - 
// name(String), id(integer), address(String) and date of birth(date type).
// Date of birth must consists of year(integer), month(integer) and day(integer ).
// Create a separate type for Date and embed this in employee type. 
// Create an array of n employees. Take a number from the user as month number . 
// The company wants to celeberate the birthdays of those employees who was born in that particular month. 
// Add a function to do this. 

// import scanner
import java.util.Scanner;
import java.io.*;

public class Employee {
    String name;
    int id;
    String address;
    Date dateOfBirth;
    
    Employee(String name, int id, String address, Date dateOfBirth) {
        this.name = name;
        this.id = id;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
    }
    
    public static void main(String[] args) {
        // Read the number of employees
        Scanner sc = new Scanner(System.in);
        // BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        InputStreamReader streamReader = new InputStreamReader(System.in);
        BufferedReader bufferedReader = new BufferedReader(streamReader);
        // System.out.println("Enter the number of employees: ");
        int n = sc.nextInt();
        if (n < 1) {
            // System.out.println("Invalid input");
            System.exit(0);
        }
        Employee[] employees = new Employee[n];
        // Read the n employees details
        // eg. Employee details is entered as: Sindhu 1 nagarbhavi-bangalore 12-12-1990
        for (int i = 0; i < n; i++) {
            // System.out.println("Enter the details of employee " + (i + 1) + ": ");
            // Read full line and split based on space
            try{
            // String line = sc.nextLine();
            // String[] details = line.split(" ");
            String name = sc.next();
            // System.out.println(name);
            int id = Integer.parseInt(sc.next());
            // System.out.println(id);
            String address = sc.next();
            // System.out.println(address);
            // next string is 12-12-1990
            String[] dob = sc.next().split("-");
            int day = Integer.parseInt(dob[0]);
            // System.out.println(day);
            int month = Integer.parseInt(dob[1]);
            // System.out.println(month);
            int year = Integer.parseInt(dob[2]);
            // System.out.println(year);
            Date dateOfBirth = new Date(year, month, day);
            employees[i] = new Employee(name, id, address, dateOfBirth);
        } catch (Exception e) {
            e.printStackTrace();
        }
        }
        // Read the month number
        // System.out.println("Enter the month number: ");
        int month = sc.nextInt();
        // Print the employees who was born in that month
        int count = 0;
        for (int i = 0; i < n; i++) {
            if (employees[i].dateOfBirth.month == month) {
                System.out.println(employees[i].name + "," + employees[i].address+ "," +employees[i].id + ",Born on " + employees[i].dateOfBirth.day + "-" + employees[i].dateOfBirth.year);
                count++;
            }
        }
        if (count == 0) {
            System.out.println("Employee with month number doesn't exist");
        }
}
}

final class Date {
    int year;
    int month;
    int day;
    
    public Date(int year, int month, int day) {
        this.year = year;
        this.month = month;
        this.day = day;
    }
    
    public int getMonth() {
        return month;
    }
}

// try {
//     System.out.print("Enter Username: ");
//     InputStreamReader streamReader = new InputStreamReader(System.in);
//     BufferedReader bufferedReader = new BufferedReader(streamReader);
//     String username = bufferedReader.readLine();
// } catch (IOException e) {
//     e.printStackTrace();
// }