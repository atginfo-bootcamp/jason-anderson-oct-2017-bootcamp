public with sharing class Business {
	

	private static String businessName = 'Emporium';
		private String locationName;
		private String address;
		private String phoneNumber;
		private List<Employee> employees;


	public Business(String locationName, String address, String phoneNumber) {
		//require all fields are passed in
		//set all field values
		///except for employee
		//this keyword
		this.locationName = locationName;
		this.address = address;
		this.phoneNumber = phoneNumber;
		//this.employees = employees;
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

	public void removeEmployee (Integer employeeId){
		for (Integer i = 0; i < employees.size(); i++) {
			Employee employee = employees.get(i);
				if (employee.getEmployeeId() == employeeId){
					employees.remove(i);
					break;
				}
		}
	}

	public List<Employee> getEmployees(){
		return null;

	}

	public Employee getEmployeeById(Integer employeeId){
		return null;

	}

	public void printLocationInfo(){
		//print out all the location information
		System.debug('location Name' + locationName);
		System.debug('address' + address);
		System.debug('phone Number' + phoneNumber);

		for (Employee employee : employees){
			employee.printEmployeeInfo();
		}
	}

	///Work on very last if finished with all other work
	public static Boolean transferEmployee(Business fromLocation, Business toLocation, Integer employeeId){
		//HINT: use getEmployeeId() to find employee on fromLocation
		//remove employ from fromLocation
		//add employee toLocation
		return false;

	}


}