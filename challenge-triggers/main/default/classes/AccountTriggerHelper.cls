public class AccountTriggerHelper {
    
    // Challenge I: Create a trigger to prevent the deletion of Accounts with Contacts.
    public static void onBeforeDelete(List<Account> old, Map<Id, Account> oldMap) {
		List<Contact> conList = [SELECT Id, AccountId FROM Contact WHERE AccountId in :oldMap.keySet()];
        for (Contact con : conList) {
            // check if the contact has an account
            if (con.accountId != Null) {
                old[0].addError('Sorry, cannot delete an account with related contact.');
            }
        }
         
    }
    
    // Challenge III: Create a trigger to create a new related Contact when an Account is inserted.
    public static void onAfterInsert(List<Account> newAccs, Map<Id, Account> newAccsMap) {
		
        List<Contact> contactsToInsert = new List<Contact>();
        
        for (Integer i = 0; i < newAccs.size(); i++) {
            Account acc = newAccs[i];
            Contact newContact = new Contact();
            newContact.FirstName = 'Test ' + i + 1;
            newContact.LastName = 'ChallengeIII';
            newContact.AccountId = acc.Id;
            
            contactsToInsert.add(newContact);
        }
        
        upsert contactsToInsert;
    }
}