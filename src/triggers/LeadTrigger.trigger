trigger LeadTrigger on Lead (before insert, after update
	) {

		//System.debug('Trigger.isInsert: ' + Trigger.isInsert);
		//System.debug('Trigger.isUpdate: ' + Trigger.isUpdate);
		//System.debug('Trigger.isDelete: ' + Trigger.isDelete);
		//System.debug('Trigger.isUndelete: ' + Trigger.isUndelete);

		//System.debug('Trigger.isBefore: ' + Trigger.isBefore);
		//System.debug('Trigger.isAfter: ' + Trigger.isAfter);

		////Trigger.isAfter
		////Trigger.isBefore

		////Records in new state being inserted to the DB
		//List<Lead> leads = Trigger.new;
		//Map<id, Lead> leadMap = Trigger.newMap;
		


		////records are populated with old values before update
		//List<Lead> oldLeads = Trigger.old;
		//Map<id, Lead> oldLeadMap = Trigger.oldMap;

		//System.debug('Trigger.new: ' + Trigger.new);
		//System.debug('Trigger.newMap: ' + Trigger.newMap);
		//System.debug('Trigger.old: ' + Trigger.old);
		//System.debug('Trigger.oldMap: ' + Trigger.oldMap);


		//Common way to chose what code to call and when
		if(Trigger.isBefore && Trigger.isInsert){
			LeadTriggerHelper.beforeInsert(Trigger.new);

			//call your code to do stuff
			///Call helper model


			//Change first lead title to below - No DML Needed in "BEFORE" context
			///leads[0].Title = 'Sausage King of Chicago';

		}	else if(Trigger.isAfter && Trigger.isUpdate){
			//else do stuff after update!!!
			//Call helper methods

			//leads[0].Title = leads[0].Id;

				LeadTriggerHelper.afterUpdate(Trigger.new, Trigger.oldMap);
		}
}