package Employee_Package;
public class Employee {

    private String firstName;
    private String lastName;
    private double monthlysalary;

    public Employee(String firstName, String lastName, double msalary) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.monthlysalary = msalary;

        // if the monthly salary is not positive, set it to 0.0.
		if (msalary < 0.0)
            monthlysalary = 0.0;
    }

    // Getters and setters for 
    // first name, last name, and salary
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public void setSalary(double msalary) {
        if (msalary < 0.0) {
            msalary = 0.0;
        }
        this.monthlysalary = msalary;
    }
    public double getSalary() {
        return monthlysalary;
    }

    public double getYearlySalary()
	{
		double yearlySalary = monthlysalary * 12;
		return yearlySalary;
	} 
    public double getRaiseSalary()
	{
		double raise =  monthlysalary * 0.1 ;
		double raiseSalary = ( monthlysalary + raise ) * 12;
		return raiseSalary;
	} 



}
