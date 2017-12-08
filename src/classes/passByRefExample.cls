public with sharing class passByRefExample {



	public static void execute (){

		Account myAccount = new Account(Name= 'My Little Pony', Type='Other');
		System.debug('initial value of my Account' + myAccount);

		modifyAccount(myAccount);
		System.debug('after calling modifyAccount: ' + myAccount);

		modifyAccountName(myAccount.Name);
		System.debug('after calling modify Account name(): ' + myAccount);
	}


	//This methid takes an account by reference and modified perpoerties on it
	//Original variable will be modified
	public static void modifyAccount(Account account ){
		account.Name = 'THE NAME WAS CHANGED IN modifyAccount';
		account.Type = 'Prospect';

	}

	//This methods takes the account name as a string (primative Data Type) and modifies it
	//this will not modify the original variable
	
	public static void modifyAccountName(String accountName){
		accountName = accountName + ' I CHANGED THE NAME AGAIN';		


	}
}