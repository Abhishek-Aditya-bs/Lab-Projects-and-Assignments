import Employee_Package.Employee;

public class EmployeeTest {
    
    public static void main(String[] args){

        Employee emp_obj_1 = new Employee("Abhishek", "Aditya", 10000.255);
        Employee emp_obj_2 = new Employee("Aditya", "Bhat", 80000.788);

        // display employee's initial yearly salary
		System.out.printf( "Yearly salary of %s %s: %.2f\n", emp_obj_1.getFirstName(), emp_obj_1.getLastName(), emp_obj_1.getYearlySalary() );
		System.out.printf( "Yearly salary of %s %s: %.2f\n", emp_obj_2.getFirstName(), emp_obj_2.getLastName(), emp_obj_2.getYearlySalary() );

        System.out.println();

        // raise employee's salary by 10%
        System.out.println( "***** Giving 10% raise for each employee *****" );
        System.out.printf( "Yearly salary of %s %s: %.2f\n", emp_obj_1.getFirstName(), emp_obj_1.getLastName(), emp_obj_1.getRaiseSalary() );
        System.out.printf( "Yearly salary of %s %s: %.2f\n", emp_obj_2.getFirstName(), emp_obj_2.getLastName(), emp_obj_2.getRaiseSalary() );
    }

}
