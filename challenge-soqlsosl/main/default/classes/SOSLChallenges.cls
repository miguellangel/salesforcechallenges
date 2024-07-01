public with sharing class SOSLChallenges {
    public List<List<sObject>> getContactsLeadsNamedTom() {
        return [FIND 'Tom' IN Name FIELDS RETURNING Contact(Name), Lead(Name)];
    }
    public List<List<sObject>> getAccountsAOAllFields() {
        return [FIND '*a*o*' IN ALL FIELDS RETURNING Account(Name)];
    }
    public List<List<sObject>> getPhoneNumberEnding1000() {
        return [FIND '?1000' IN ALL FIELDS RETURNING Account(Name), Contact(Name), Lead(Name)];
    }
}