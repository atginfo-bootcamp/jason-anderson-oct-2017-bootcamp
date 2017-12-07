@isTest
private class AccountAndOppCreatorController_ANDERSTST {

	private static AccountAndOppCreatorController_ANDERS initData() {
		AccountAndOppCreatorController_ANDERS controller = new AccountAndOppCreatorController_ANDERS();
		controller.account.Name = 'Test Name';
		controller.account.AccountNumber = 'Test AccountNumber';
		controller.account.Description = 'Test Description';
		controller.account.Type = 'Other';

		controller.contact.FirstName = 'My Little';
		controller.contact.LastName = 'Pony';
		controller.contact.Salutation = 'Mr.';
		//account type set autmatically

		controller.opportunity.Name = 'Opp Name';
		controller.opportunity.Type = 'New Customer';
		//stagename and closed date are set auotmatically
		
		//public account = Account();
		//public contact = Contact();
		//public opportunity = Opportunity();
		return controller;

	}
	
	@isTest static void testControllerInit() {
		// Implement test code
		AccountAndOppCreatorController_ANDERS controller = new AccountAndOppCreatorController_ANDERS ();
		
		//take 2 variables together - similar to if statements to check if these are equals
		System.assertNotEquals(null, controller.account);
		System.assertNotEquals(null, controller.contact);
		System.assertNotEquals(null, controller.opportunity);
		System.assertEquals(false, controller.showCreatedDataSection);
		
		System.assertEquals('Needs Analysis', controller.opportunity.StageName);
		System.assertEquals(Date.today().addDays(30), controller.opportunity.CloseDate);

	}
	
	@isTest static void testAccountNameRequired() {
		// Implement test code
		AccountAndOppCreatorController_ANDERS controller = initData();

		controller.account.Name = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());
		//query account contact opps and make sure size = 0
		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contact = [SELECT Id FROM Contact];
		List<Opportunity> opportunity = [SELECT Id FROM Opportunity];

		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contact.size());
		System.assertEquals(0, opportunity.size());

	}


		
	@isTest static void testAccountNumberRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();

		controller.account.AccountNumber = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getmessages().size());

}


	@isTest static void testTypeRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();

		controller.account.Type = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getmessages().size());

}

	@isTest static void testFirstNameRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();

		controller.contact.FirstName = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getmessages().size());

}	


	@isTest static void testLastNameRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();

		controller.contact.LastName = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getmessages().size());
}

	@isTest static void testOpTypeRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();

		controller.opportunity.Type = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getmessages().size());
}

	@isTest static void testStageNameRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();

		controller.opportunity.StageName = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getmessages().size());
}
	@isTest static void testCloseDateRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();

		controller.opportunity.CloseDate = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getmessages().size());
}


	@isTest static void testOppNameDefaultsToAccountName() {
		// Implement test code
		//if opp name is null, should be set to account name
		
		AccountAndOppCreatorController_ANDERS controller = initData();
			
		controller.opportunity.Name = null;

		controller.saveData();

		System.assertEquals(controller.savedOpportunity.Name, controller.savedAccount.Name);

	}


		@isTest static void testOppNameRetainsValue() {
		// Implement test code
		//ensure that specififed Opp name retains value - not overwritten

	}
		@isTest static void testSuccessPath() {
		// Implement test code
		//Test that everything was created
		//test that all values were reinitialized
		//test that bottom section of UI is shown
		//test that bottom of UI is correct data
		//test atht init values were set



	}

}