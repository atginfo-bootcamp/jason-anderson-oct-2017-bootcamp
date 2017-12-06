public with sharing class BulkDeleteAccountsController {

	//public List<Account> accounts;
	public List<AccountWrapper> accountWrappers {get; set;}
	public Boolean selectAll {get; set;}
	//excercise code
	public String newInputName;
	public Integer newInputAccounts;


	public BulkDeleteAccountsController() {
		initializeAccountWrappers();
		this.selectAll = false;
	}

	public void initializeAccountWrappers() {
		List<Account> accounts = [SELECT Id, Name, Type FROM Account];
		//return accounts;
		accountWrappers = new List<AccountWrapper>();

			for(Account account : accounts){
				AccountWrapper accountWrapper = new AccountWrapper(account);
				accountWrappers.add(accountWrapper);
			}
	}

	//here is my new code

	public PageReference createNewAccounts() {
		List<Account> createAccounts = new List<Account>();
			for(Integer i = 0; i < 10; i++){
				System.debug('i: ' + i);
		}
		return null;
		}


	//public Boolean getSelectAll(){
	//	return selectAll;
	//}

	//public void setSelectAll(Boolean selectAll){
	//	this.selectAll = selectAll;
	//	for(AccountWrapper accountWrapper : accountWrappers){
	//		accountWrapper.isChecked = selectAll;
	//	}
	//}
	
	public PageReference toggleSelectAll(){
			for(AccountWrapper accountWrapper : accountWrappers){
			accountWrapper.isChecked = selectAll;
		}
		return null;
	}

	public PageReference deleteSelectedAccounts(){
			List<Account> accountsToDelete = new List<Account>();
			for(AccountWrapper accountWrapper : accountWrappers){
				if (accountWrapper.isChecked){
						accountsToDelete.add(accountWrapper.account);
			}
		}
		try {

			delete accountsToDelete;

		}catch(Exception ex){
			System.debug(ex);
			ApexPages.addMessages(ex);
		}
		initializeAccountWrappers();
		return null;

	}


	public class AccountWrapper {
		public Boolean isChecked {get; set;}
		public Account account {get; set;}

		public AccountWrapper (Account account){
			this.isChecked = false;
			this.account = account;

		}
	}

}