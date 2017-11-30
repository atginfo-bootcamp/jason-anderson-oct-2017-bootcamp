public with sharing class myAccountController {
	
	private final Account account;

	public myAccountController() {
		System.debug('MyAccountController()');
		//the code below is commonly googled due to the specifics related to the parameters and pages
		String accountId = ApexPages.currentPage().getParameters().get('id');
		account = [
		SELECT Id, Name, Type FROM Account WHERE id = :accountId

		];
	}	
	//standard getter method
	public Account getAccount(){
		return account;

	}
	//sometimes to redirct user - with null keep on the same page but refresh
	public PageReference save(){

		update account;
		return null;

	}

}