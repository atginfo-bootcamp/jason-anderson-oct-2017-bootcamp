//
//to invoke from dev console: Day3ListsAndLoops.execute
//

public with sharing class Day3ListsAndLoops {

	public static void execute(){

		//create sting variable called my name
		String myName = 'Json';

		//Create new empty list called names
		//THIS IS THE PREFERRED WAY TO INITIALIZE
		List<String> names = new List<String>(); 

		//Create new list with default values
		List<String> students = new List<String>{'Student 1', 'Student 2'};

		//Alternate syntax for creating a new array (list) with 20 empty spaces
		String[] employees = new String[20];

		names.add('jason');
		names.add('seth');
		names.add('austin');
		names.add('lane');

		System.debug('names: ' + names);

		//remove item at 0
		names.remove(0); 

		System.debug('names before last element removed: ' + names);

		//dynamically remove last element in array
		names.remove(names.size()-1);

		System.debug('names after removing names: ' + names);

		//setting up and testing the multiple but Set 

		Set<String> uniqueNames = new Set<String>();
		uniqueNames.add('jdog');
		uniqueNames.add('jdog');
		uniqueNames.add('jdog');
		uniqueNames.add('jdog');
		uniqueNames.add('jdog');
		uniqueNames.add('jdog');
		uniqueNames.add('jdog');
		uniqueNames.add('jdog');
		uniqueNames.add('jdog');

		//below will return 1 for size based on the similarity bw all names provided
		Integer setSize = uniqueNames.size();

		System.debug('uniqueNames: ' + uniqueNames);
		System.debug('setSize: ' + uniqueNames.size());



		}
public static void executeLoops() {

		//for loop takes 3 parameters
		//indexVariable
		//condition
		//counterVariable

		for(Integer i = 0; i < 10; i++){
			System.debug('i: ' + i);

		}

		List<String> names = new List<String>(); 
		names.add('jason1');
		names.add('jason2');
		names.add('jason3');
		names.add('jason4');
		names.add('jason5');

		for (Integer i = 0; i < names.size(); i++) {
			System.debug(names.get(i));
		}

		for (Integer i = 0; i < names.size(); i++) {
			System.debug(names[i]);

		}
		//Advanced for loop - loop every item in list
		for(String name : names ) {
			System.debug(name);
		}
	}


	public static void createNewAccount() {

		Account myAccount = new Account();  
		myAccount.Name = 'ATG';
		myAccount.Type = 'Prospect';


		System.debug('myAccount before insert: ' + myAccount);

		insert myAccount;

		//statement below will capture ID now that it is in the DB(after insert)
		System.debug('myAccount before insert: ' + myAccount);

	}
		//This is the query for looking at Accounts and certain information (using soql/sosl)
	public static void updateExistingAccount()
	{
		List<Account> queriedAccounts = [
			 SELECT id, Name, Type
			 FROM Account
			 WHERE Name = 'ATG'
			 LIMIT 1 //limits to only 1 return
			 ];
		System.debug(queriedAccounts);

		if (queriedAccounts.size() > 0) {
			Account myAccount = queriedAccounts[0];
			myAccount.Name = 'CHANGED ACCOUNT NAME';
			update myAccount;
		}

	}
	public static void updateAccountTypeOnEveryAccount() {
		//Query All accounts
		//Loop through Accounts
		//Print out all accounts to console
		//Updated Type = Other
		//Print out the account to the console
		//Update Accounts (DML)

		List<Account> queriedAccounts = [
		 	SELECT id, Name, Type
			 FROM Account
			 ];
			 		//Advanced for loop - loop every item in list
		for(Account currentAccount : queriedAccounts) {
			currentAccount.Type = 'Other';
			
			System.debug(currentAccount);
		}
			update queriedAccounts;

	}



}