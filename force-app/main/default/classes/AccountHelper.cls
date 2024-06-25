public with sharing class AccountHelper {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsLikeQuery(String query){
        try {
            String sanitizedQ = String.escapeSingleQuotes(query);
            String q = '%' + sanitizedQ + '%';
            return [SELECT Id, Name FROM Account WHERE Name LIKE :q];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}