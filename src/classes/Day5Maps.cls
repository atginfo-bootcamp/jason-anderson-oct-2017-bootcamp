public with sharing class Day5Maps {

	public static void example(String name){

		//for review - this is the syntax of a list
		List<String> namesList = new List<String>();

		namesList.add('Jason');
		namesList.add('John');
		namesList.add('Jack');
		namesList.add('Jared');

		//keep track if name is found
		Boolean foundName = false;

		for(String currentName :  namesList){
			if(currentName == name) {
				System.debug('Found Name in List: ' + name);
				foundName = True;
			//exits out of for loop if found something
				break; 
			}
		}

		//if found name is false then BANG
		if(!foundName){
			System.debug('Name Not Found in List: ' + name);
		}


		Map<String, String> namesMap = new Map<String, String>();

		namesMap.put('Jason', 'Betty Boop');
		namesMap.put('John', 'John Boop');
		namesMap.put('Jack', 'Jack Boop');
		namesMap.put('Jared', 'Jared Boop');

		if(namesMap.containsKey(name)) {
				System.debug('Found Name in map: ' + name);
				}else {
				System.debug('Name not found in map: ' + name);
		}

	}

	public static void associateContactsToAccounts(){

		//Alternate syntax
		//Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Name FROM Account]);

		List<Account> accountList = [SELECT Id, Name FROM Account];
		Map<Id, Account> accountMap = new Map<Id, Account>(accountList);

		List<Contact> contacts = [
		SELECT Id, FirstName, LastName, Name, AccountId
		FROM Contact
		];

		//loop through contacts
		//print out the name of the contact and the account name

		
		for(Contact currContact : contacts) {
			if(accountMap.containsKey(currContact.AccountId)){
				Account foundAccount = accountMap.get(currContact.AccountId);
				System.debug('FoundAccount: ' + foundAccount.Name + ' - ' + currContact.Name);
			}
		}

	}

}