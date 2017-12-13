public with sharing class OpportunityTriggerHelper {
	
	private static List<Opportunity> queryOpps(List<Opportunity> myOpps){
		Set<Id> opptyIds = new Set<id>();
		List<Opportunity> queryOpptys = new List<Opportunity>();
				 
		for(Opportunity oppty : myOpps){

			opptyIds.add(oppty.Id);
			}

				if(opptyIds.size() > 0) {

			 		queryOpptys = [
				 		Select Id, Name, StageName, OwnerId, AccountId, CloseDate, Amount
	                	From Opportunity 
	                	Where Id In : opptyIds
	                	AND StageName =: 'Closed Won'
	                ];
	            }
	            return queryOpptys;
	        }
	public static void createContracts(List<Opportunity> queryOpptys){
		List<Contract> contractsToInsert = new List<Contract>();
		for(Opportunity oppty : queryOpptys){
			Contract newContract = new Contract ();
			newContract.AccountId = oppty.AccountId;
			newContract.StartDate = oppty.CloseDate;
			newContract.ContractTerm = 12;
		//add more fields here if needed
			contractsToInsert.add(newContract);
		}
		insert contractsToInsert;
	}

	public static void handleOpsAfterInsert (List<Opportunity> opptys) {
		createContracts(queryOpps(opptys));
		//another way to do this is below (2 ways to solve)
		//List<Opportunity> opptastic = queryOpps(opptys);
		//createContracts(opptastic);
	}

	public static void handleOpsAfterUpdate(){


	}
}