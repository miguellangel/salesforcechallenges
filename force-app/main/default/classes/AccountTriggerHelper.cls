public class AccountTriggerHelper {
    public void onBeforeDelete(List<Account> old, Map<Id, Account> oldMap) {
		// Create a trigger to prevent the deletion of Accounts with Contacts.
		List<Contact> conList = [SELECT Id, AccountId FROM Contact WHERE AccountId in :oldMap.keySet()];
        for (Contact con : conList) {
            // check if the contact has an account
            if (con.accountId != Null) {
                con.addError('Sorry, cannot delete an account with related contact.');
            }
            
        }
         
    }
}