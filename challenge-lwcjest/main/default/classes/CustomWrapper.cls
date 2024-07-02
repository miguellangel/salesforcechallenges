public with sharing class CustomWrapper {
    @AuraEnabled
    public String firstName { get; set; }
    @AuraEnabled
    public String lastName { get; set; }
    @AuraEnabled
    public Id accountId { get; set; }

    // public CustomWrapper(Contact con) {
    //     this.firstName = con.FirstName;
    //     this.lastName = con.LastName;
    //     this.accountId = con.AccountId;
    // }

}