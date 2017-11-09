public with sharing class LeadTriggerHelper {

		public	static void beforeInsert(List<Lead> leadsList){
			//call your code to do stuff
			///Call helper model


			//Change first lead title to below - No DML Needed in "BEFORE" context
			//leads[0].Title = 'Sausage King of Chicago';
			
			for (Lead currLead : leadsList){
				currLead.Title = 'CEO';
			}
			hotLead(leadsList);

		}

		public static void afterUpdate(List<Lead> leadsList, Map<Id, Lead> oldLeadsMap){
		//	//Update the lead title to the leads ID 
		//	//Call helper methods
		//	for (Lead currLead : leadsList){
		//	currLead.title = currLead.Id;

		//	}
		//	update leadsList;

			hotLead(leadsList);
		}

		public static void hotLead (List<Lead> leads){
			//New method called hotLead in Lead trigger
			//Query all Leads with Title from prior class (I used King).
			//Add 5 more Leads to the list (not through existing King method so that they are not inserted yet)
			//Make all Leads have a Rating of 'Hot'
			//Upsert the entire list of leads
			//**Verify**
			//Remove 5 additional leads code
			//Add in check to only update when needed
			
			//Query for existing Kings
			List<Lead> kingLeads = [SELECT Title, Rating FROM Lead WHERE Title = 'Sausage King of Chicago'];

			//Looped to create 5 times to create 5 new leads all Fry and made all SKOC
			//Added each new lead to the kingleads list to keep track of all of our kings
			//for(Integer i = 0; i < 5; i++){
			//	Lead newLead = new Lead();
			//	newLead.LastName = 'Fry';
			//	newLead.Company = 'Burger Town';
			//	newLead.Title = 'Sausage King of Chicago';
			//	newLead.Rating = 'Hot';

			//	kingLeads.add(newLead);
			//}
			
			//Looped through newly insert leads checkign for SKOC
			//Becasuse the would have been returned by the soql query

			for (Lead currLead : leads){
				if( currLead.Title == 'Sausage King of Chicago'){
					//kingLeads.add(currLead);
					currLead.rating = 'Hot';
				}
			//Loop through all of the SKOC leads and make them Hot
			}
			for(Lead currLead : kingLeads){
				currLead.Rating = 'Hot';

				}
			upsert kingLeads;
		}
}