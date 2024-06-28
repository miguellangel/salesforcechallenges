trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    switch on (Trigger.operationType) {
        when AFTER_UPDATE {
            OpportunityTriggerHelper.onAfterUpdate(Trigger.old, Trigger.oldMap, Trigger.new, Trigger.newMap);
        }
    }
}