//Employee david = new Employee(...);

public with sharing class Employee {

	private static Integer nextEmployeeIdNumber = 1;
	//set these in constructor
	private final Integer EMPLOYEE_ID;
	private String title;
	private String firstName;
	private String lastName;

	private Date hireDate;
	private String status;
	private Datetime statusDate;


	public Employee(String title, String firstName, String lastName) {
		//IMPLEMENT THIS
		this.hireDate = Date.today();
		this.status = 'Active';
		this.statusDate = Datetime.now();
		this.title = title;
		this.firstName = firstName;
		this.lastName = lastName;
		EMPLOYEE_ID = nextEmployeeIdNumber;
		nextEmployeeIdNumber++;
	}
		//alternative get and set syntax
		//this.lastName = lastName {get, set;}
		// can also add additional logic into the method to add business logic
		//


	public Integer getEmployeeId() {
		return EMPLOYEE_ID;

	}
	public void setStatus(String status) {
		this.status = status;
		statusDate = Datetime.now(); 
}
	public String getStatus() {
		return status;
}

	public void printEmployeeInfo() {
		System.debug('title: ' + title); 
		System.debug('First Name: ' + firstName); 
		System.debug('Last Name: ' + lastName); 
		System.debug('Hire Date: ' + hireDate); 
		//System.debug('Title: ' + title); 
		System.debug('Status: ' + status); 
		System.debug('Employee ID: ' + EMPLOYEE_ID); 
	}
}