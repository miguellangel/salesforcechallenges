trigger CaseTrigger on Case (before insert, after insert) {
    switch on (Trigger.operationType) {
        when AFTER_INSERT {
            CaseHelper.handleAfterInsert(Trigger.new, Trigger.newMap);
        }
    }
}