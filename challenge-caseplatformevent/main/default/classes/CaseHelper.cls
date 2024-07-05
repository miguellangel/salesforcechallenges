public class CaseHelper {
    public static void handleAfterInsert(List<Case> newCases, Map<Id, Case> newCasesMap) {
        
        List<High_Priority_Case__e> publishEvents = new List<High_Priority_Case__e>();
        
        for (Case currentCase : newCases) {
            if (currentCase.Priority == 'High') {
                High_Priority_Case__e event = new High_Priority_Case__e();
                event.Message__c = 'HIGH Priority Alert: Case Number: ' + currentCase.CaseNumber;
                publishEvents.add(event);
                system.debug('Published Platform Event: ' + event);
            }
        }
        
        if(publishEvents.size() > 0) {
            EventBus.publish(publishEvents);
		}
    }
}