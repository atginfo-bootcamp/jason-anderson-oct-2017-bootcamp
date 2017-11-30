public with sharing class NewAccountController {
	//creates getter and setter at the same time - once set dont set again
	public Account account { get; private set; }



	public NewAccountController() {
		String accountId = ApexPages.currentPage().getParameters().get('id');
		
		//if account id is null then create a new account ( if true : if false) if not run query
		account = accountId == null ? new Account() : [
		SELECT Id, Name, Type, Phone, Industry FROM Account WHERE id = :accountId];
	}

	public PageReference save(){
		try{
			upsert account;

		} catch(Exception ex) {
			ApexPages.addMessages(ex); //add messages throw banner instead of 'puke on page'
		}
	//after save, redirect to record page
		PageReference reDirectSuccess = new ApexPages.StandardController(account).view();
		return redirectSuccess;
	}

}

