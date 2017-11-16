public with sharing class Business {
	

	private static String businessName = 'Emporium';
		private String locationName;
		private String address;
		private String phoneNumber;
		private List<Employee> employees;


	public Business() {
		//require all fields are passed in
		//set all field values
		///except for employee
		//this keyword

		//code below initializes the list so we can add employees to it

		this.employees = new List<Employee>();

	}

	public void addEmployee(Employee employee){
		//shorthand syntax below
		//Call other addemployee() Method to keep business logic centralized
		addEmployee(new List<Employee>{employee});

	}

	public void addEmployee(List<Employee> employees){
		//pretend we have a lot of other business logic here
		this.employees.addAll(employees);

	}

	public void removeEmployee (List<Employee> employeeId){
	
	}

	public List<Employee> getEmployees(){
		return null;

	}

	public Employee getEmployeeById(Integer employeeId){
		return null;

	}

	public void printLocationInfo(){
		//print out all the location information

	}

	///Work on very last if finished with all other work
	public static Boolean transferEmployee(Business fromLocation, Business toLocation, Integer employeeId){
		//HINT: use getEmployeeId() to find employee on fromLocation
		//remove employ from fromLocation
		//add employee toLocation
		return false;

	}


}