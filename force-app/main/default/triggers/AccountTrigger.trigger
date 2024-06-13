trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    
    AccountTriggerHelper helper = new AccountTriggerHelper();
    
    switch on (Trigger.operationType) {
        when BEFORE_DELETE {
            helper.onBeforeDelete(Trigger.Old, Trigger.oldMap);
        }
    }
}