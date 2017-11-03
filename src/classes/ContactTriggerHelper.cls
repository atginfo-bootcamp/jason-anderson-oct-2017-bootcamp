public with sharing class ContactTriggerHelper {

	public static void handleAfterInsert(List<Contact> contacts){
		//if contact has account has contact assgined update number of contacts on account
		
		/*Set<Id> accountId = new Set<Id>();

		for(Contact contact : contacts) {
			if(contact.accountId != null){
				accountIds.add(contact.accountId);
			}
		}

		//if(!accountIds.isEmpty())
		if(accountIds.size() > 0){
			List<Account> accounts = [SELECT Id, Current_number_of_contacts__c FROM Account WHERE Id IN :accountIds];
		}

*/
		List<Account> accounts = queryAccountsFromContacts(contacts);
		updateAccountNumberOfContacts(accounts);
	}	

	public static void handleAfterUpdate(List<Contact> contacts, Map<Id, Contact> oldContactMap){
		// Loop through contacts
		// Check if Account id was changed
		//1) if null -> not null ---> update account (number of contacts)
		//2) not null ---> null ----> update old account (number of contacts)
		//3) not null --> not null ---> Contact assigned to different account)----> update both accounts
		
		Set<Id> accountIds = new Set<Id>();

		for(Contact contact : contacts) {
			Contact oldContact = oldContactMap.get(contact.Id);
			if (Contact.AccountId != oldContact.AccountId) {
				//the account id was changed
				if (contact.AccountId != null){
					accountIds.add(contact.AccountId);
				}
				if (oldContact.AccountId != null){
					accountIds.add(oldContact.AccountId);
				}

			}
		}

		List<Account> accounts = queryAccounts(accountIds); 

		updateAccountNumberOfContacts(accounts);
	}

	public static void handleAfterDelete(List<Contact> contacts){

	}

	//helper method 1
	private static List<Account> queryAccountsFromContacts(List<Contact> contacts) {
		
		Set<Id> accountIds = new Set<Id>();

		for(Contact contact : contacts) {
			if(contact.accountId != null){
				accountIds.add(contact.accountId);
			}
		}
		return queryAccounts(accountIds);

	}

	//helper method 2
	private static List<Account> queryAccounts(Set<Id> accountIds){
		List<Account> accounts = new List<Account>();

		//if(!accountIds.isEmpty())
		if(accountIds.size() > 0){
			accounts = [SELECT Id, Current_number_of_contacts__c,
				(SELECT Id FROM Contacts)
			FROM Account
			WHERE Id
			IN :accountIds

			];
		}
		return accounts;
	}

	private static void updateAccountNumberOfContacts(List<Account> accounts){
		if(accounts.size() > 0) {

			for (Account account : accounts){
				//Integer numberOfContacts = account.Contacts.size(); //alternative syntaz
				account.Current_number_of_contacts__c = account.Contacts.size();
			}
			update accounts;
		}
	}
}