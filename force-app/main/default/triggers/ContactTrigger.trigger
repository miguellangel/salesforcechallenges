trigger ContactTrigger on Contact (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    switch on (Trigger.operationType) {
        
        when BEFORE_INSERT {
            ContactTriggerHelper.onBeforeInsert(Trigger.new, Trigger.newMap);
        }
        
        when AFTER_UPDATE {
            ContactTriggerHelper.onAfterUdpate(Trigger.old, Trigger.oldMap, Trigger.new, Trigger.newMap);
        }
        
    }
}