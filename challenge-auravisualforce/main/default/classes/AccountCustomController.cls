public with sharing class AccountCustomController {

	private final Account account;
    
    public string selectedLang {get;set;}
    public List<selectoption> listOfLang {get;set;}
    
    public AccountCustomController() {
        this.account = [SELECT Id, Name FROM Account WHERE Id = '001bm000004VcIdAAK'];
        
        this.selectedLang='en';

        listOfLang = new List<selectOption>();
        listOfLang.add(new selectOption('en','English'));
        listOfLang.add(new selectOption('es','Spanish'));
        
    }

    public Account getAccount() {
        return this.account;
    }
}