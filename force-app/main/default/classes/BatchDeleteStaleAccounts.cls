public with sharing class BatchDeleteStaleAccounts implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Name FROM Account WHERE Id NOT IN (SELECT AccountId FROM Opportunity WHERE (StageName != "Closed Won" AND StageName != "Closed Lost" AND CloseDate < NEXT_N_MONTHS:6))');
    }
    
    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        List<Account> staleAccs = new List<Account>();
        
        for (sObject s : scope) {
            staleAccs.add((Account)s);
        }
        
        delete staleAccs;
    }
    
    public void finish(Database.BatchableContext BC) {}
}