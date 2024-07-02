public with sharing class ContactHelper {

    @AuraEnabled
    public static void createContact(CustomWrapper wrapper){
        try {
            Contact newContact = new Contact();
            newContact.FirstName = wrapper.firstName;
            newContact.LastName = wrapper.lastName;

            
            System.debug('hello there ' + newContact.FirstName);
            insert newContact;


        } catch (Exception e) {
            System.debug('CATCHING ERROR');
            throw new AuraHandledException(e.getMessage());
        }
    }
}
