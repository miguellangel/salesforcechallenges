trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    
    switch on (Trigger.operationType) {

        when AFTER_INSERT {
            AccountTriggerHelper.onAfterInsert(Trigger.new, Trigger.newMap);
        }
        
        when BEFORE_DELETE {
            AccountTriggerHelper.onBeforeDelete(Trigger.Old, Trigger.oldMap);
        }
    }
}