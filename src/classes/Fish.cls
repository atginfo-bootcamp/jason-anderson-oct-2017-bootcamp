public with sharing class Fish implements Animal{
	public Fish() {
		
	}

	public void speak(){
		System.debug('The fish smells horrible');

	}
	public void eat(String typeOfFood){
		System.debug('The fish only likes  ' + typeOfFood);

	}
	public void die(){
		System.debug('The fish dies....  ');

	}
}