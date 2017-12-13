trigger OpportunityTrigger on Opportunity (after insert, after update) {


	if(Trigger.isAfter && Trigger.isInsert){
		OpportunityTriggerHelper.handleOpsAfterInsert(Trigger.new);

	}
	if (Trigger.isAfter && Trigger.isUpdate){ 
	
		//OpportunityTriggerHelper.handleOpsAfterUpdate(Trigger.new, Trigger.oldMap);
	} 

}