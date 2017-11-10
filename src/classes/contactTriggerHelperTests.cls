@isTest
private class contactTriggerHelperTests {
	//Test class for testing COntract Triggers

	private static void stageData(Integer numAccounts, String accountName){

		//create new accounts based on numAccounts parameter
		//Set up Account fields (i.e. use accountName)
		//need to insert Accounts to the database
		//Query our Accounts from the DB
		//Lop through the Accounts
		//Create some Contacts for each account (AccountId populated)
		//Insert contacts to the database all at once
		//

		List<Account> accounts = new List<Account>();
		for(Integer i = 0; i<numAccounts;i++){
			Account acct = new Account();
			acct.Name = accountName + ' ' + i;
			accounts.add(acct);
		}
		insert accounts; 

		List<Account> accountsFromDB = [
			SELECT Id
			FROM Account
			WHERE Name LIKE :accountName + '%'
		];

		List<Contact> contactList = new List<Contact>();

		for(Account acct: accountsFromDB){
			Integer numberOfContacts = (Integer)(Math.random()*4);
			for(Integer i = 0; i<numberOfContacts; i++){
				Contact contact = new Contact();

				contact.LastName = 'Test Boid';
				contact.AccountId = acct.Id;

				contactList.add(contact);

			}
		}

		insert contactList;
	}

	@isTest static void insertTriggerTest() {
		// Implement test code
		stageData(10, 'Seth');

		List<Account> accountList = [
		SELECT Name, Current_number_of_contacts__c,
			(SELECT LastName, AccountId FROM Contacts)
		FROM Account
		];

		//System.assert(accountList.size() ==10);
		System.assertEquals(accountList.size(), 10, 'You did it wrong.  Not 10 accounts');

		for(Account acct : accountList){
			System.debug('For Account ' + acct.Name +  ' there are ' + acct.Contacts.size() + 'accounts');
}

	}
	
	@isTest static void updateTriggerTest() {
		// Implement test code



	}
	
}