public class OpportunityTriggerHelper {
    // Create a trigger to update the Name field of the related Account 
    // when a Opportunity's Name field is updated. The Account and Opportunity should end up having the same value in their name fields.
    public static void onAfterUpdate(List<Opportunity> oldOpps, Map<Id, Opportunity> oldOppsMap, List<Opportunity> newOpps, Map<Id, Opportunity> newOppsMap) {
        
        Map<Id, String> IdNameMap = new Map<Id, String>();
        
        for (Opportunity opp : newOpps) {
            // map accountId and its Name
            IdNameMap.put(opp.AccountId, opp.Name);
        }
        
        List<Account> accs = [SELECT Name FROM Account WHERE Id IN :IdNameMap.keySet()];
        
        for (Account acc : accs) {
            acc.Name = IdNameMap.get(acc.Id);
        }
        
        update accs;
        
    }
}