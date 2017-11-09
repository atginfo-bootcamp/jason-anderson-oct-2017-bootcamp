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


	}

	@isTest static void test_method_one() {
		// Implement test code
	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}