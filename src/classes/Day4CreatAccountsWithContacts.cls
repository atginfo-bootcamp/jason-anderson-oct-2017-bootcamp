public with sharing class Day4CreatAccountsWithContacts {

	public static void createAccountsAndContacts(Integer numAccounts) {

		//create accounts with contacts associated to them
		//create accounts first, then contacts
		//Loop 'numAccounts' number of times to create 'numAccounts' number of accounts
		//Account name must be "myAccount-"#
		//insert accounts in bulk (initially do not insert to experience limits)
		//create two contacts for each account
		//insert contacts
		//query accounts and subquery contacts
		//Loop through accounts and contacts
		//print out all contacts for each account and the account name 

		List<Account> createdAccounts = new List<Account>();
		List<Contact> createdContacts = new List<Contact>();

		 for (Integer i = 0; i<numAccounts; i++) {
		 	System.debug('Creating account ' + i);
		 	Account createdAccount = createAccount(i);
			createdAccounts.add(createdAccount);
			//createdAccounts.add(createAccount(i)); //This is identical as the one above
			
		 }
		insert createdAccounts;

		for (Account currAccount : createdAccounts){
			createdContacts.add(createContact(currAccount.id, 1));
		 	createdContacts.add(createContact(currAccount.id, 2));

		}

		insert createdContacts; 

	}
	//note that the lines 24 and 25 can be combined
	public static Account createAccount(Integer accountNameSuffix) {
		String accountName = 'myAccount-' + accountNameSuffix;
		Account myAccount = new Account(Name = accountName);
			System.debug('My account ' + myAccount);
			return myAccount;
	}

	public static Contact createContact(Id accountID, Integer contactNumber){
		Contact newContact = new Contact(
		FirstName ='Contact First Name: '+ contactNumber,
		LastName = 'Contact Last Name: '+ contactNumber,
		AccountId = accountId 
		);
		System.debug('newContact: ' + newContact);
		return newContact;
	}


	public static void queryAndPrintAccountsAndContacts() {

		List<Account> queriedAccounts = [
			SElECT Id, Name, 
				(SElECT Id, FirstName, LastName, Name FROM Contacts)
			FROM Account
			WHERE Name LIKE 'myAccount%'
		];

		for(Account currAccount : queriedAccounts){
			System.debug ('currAccount: ' + currAccount.name);
			for(Contact currContact : currAccount.Contacts) {
			System.debug ('currContact: ' + currContact.name);
			}
		}
	}


}