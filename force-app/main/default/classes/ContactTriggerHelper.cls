public class ContactTriggerHelper {
    // Challenge II: Create a trigger to set a default value for Email on Contacts that are inserted without one.
    public static void onBeforeInsert(List<Contact> newCons, Map<Id, Contact> newConsMap) {
        for (Contact con : newCons) {
            con.Email = 'default@email.com';
        }
    }
    
    // Challenge IV: Create a trigger to update the phone field of the related Account 
    // when a Contact's phone field is updated. The Account and Contact should end up having the same value in their phone fields.
    public static void onAfterUdpate(List<Contact> oldCons, Map<Id, Contact> oldConsMap, List<Contact> newCons, Map<Id, Contact> newConsMap) {

        
        Map<Id, String> AccountIdPhoneMap = new Map<Id, String>();
        
        for (Contact con : newCons) {
            AccountIdPhoneMap.put(con.AccountId, con.Phone);
        }
        
        List<Account> accs = [SELECT Name, Phone FROM Account WHERE Id IN :AccountIdPhoneMap.keySet()];
        
        for (Account acc : accs) {
            acc.Phone = AccountIdPhoneMap.get(acc.Id);
        }
        
        upsert accs;
    }
}