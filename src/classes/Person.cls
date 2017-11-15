//
//Person class
//A class is made up of the following 3 elements:
//
//Classlevel propoerties
//all other methods
//constructor method
//

public class Person {
	//static variables are shared across ALL Instances
	private static Boolean isHuman = true;


	//CREATE GETTER AND SETTER FOR EACH OF THESE
	private String name;
	private String email;
	private String gender;
	private Double weight;
	private Integer age;
	//CREATE GETTER METHOD
	private final boolean IS_DEAD;
	//final denotes initializing right away and cannot be changed - note the ALL Capital letters

	//name is required when entered in the ()
	//from here down is the constructor
	public Person(String defaultName) {
		name = defaultName;
		IS_DEAD = false;
		//alternate syntax 
		//this.name = defaultName;
	}
	//overloaded constructor
	//Constructor is a  constructor is an instance method that usually has the same name as the class, and can be used to set the values of the members of an object, either to default or to user-defined values
	//Person fred = new Person ('fred', 'foo@bar.com');
	public Person(String defaultName, String defaultEmail) {
		name = defaultName;
		email= defaultEmail;
		IS_DEAD = false;
		}

	public Person(String defaultName, String defaultEmail, Boolean defaultIsDead) {
		name = defaultName;
		email= defaultEmail;
		IS_DEAD = defaultIsDead;
		}

	//static is not here because this is not a method that is an instance method
	public void print(){
		System.debug('Person name: ' + name);
		System.debug('Person email: ' + email);
		System.debug('Person gender: ' + gender);
		System.debug('Person weight: ' + weight);
		System.debug('Person age: ' + age);
		System.debug('Person is dead: ' + IS_DEAD);
		System.debug('Person is Human: ' + isHuman);

	}

	public void setIsHuman(Boolean isHumanVal){
		isHuman = isHumanVal;
	}

	public String getName(){
		return name;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getEmail(){
		return email;
	}

	public void setEmail(String email){
		this.email = email;
	}

	public String getGender(){
		return gender;
	}

	public void setGender(String gender){
		this.gender = gender;
	}

	public Double getWeight(){
		return weight;
	}

	public void setWeight(Double weight){
		this.weight = weight;
	}

	public Integer getAge(){
		return age;
	}

	public void setAge(Integer age){
		this.age = age;
	}
}