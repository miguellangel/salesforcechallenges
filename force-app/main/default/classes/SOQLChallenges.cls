public class SOQLChallenges {
    
    // Challenge I: Write a class called DataLord that has 1 method called NumAccounts. 
    // This method should return the number of Accounts that exist in org
    public static Integer DataLord() {
        AggregateResult nAccounts = [SELECT count(ID) FROM Account];
        return (Integer)nAccounts.get('expr0');
    }
                                      
	// Challenge II: Write a method called NumHot. 
	// This method should return the number of Accounts with a Rating of Hot
	public static Integer NumHot() {
        AggregateResult nAccountsHot = [SELECT count(ID) FROM Account WHERE Rating = 'Hot'];
        return (Integer)nAccountsHot.get('expr0');
    }
    
    // Challenge III: Write a method called NumComplex. 
    // This method should return the number of Accounts that have an ampersand (&) in the Name
    public static Integer NumComplex() {
        AggregateResult nAmpersand = [SELECT count(ID) from Account WHERE Name LIKE '%&%'];
        return (Integer)nAmpersand.get('expr0');
    }
    // Challenge IV: Write a method called BigFive. 
    // This method should return the top 5 Accounts in terms of Annual Revenue. 
    // You may only use 1 line of code for the method body
    public static List<Account> BigFive() {
        return [SELECT Id, Name, AnnualRevenue FROM Account WHERE AnnualRevenue != Null ORDER BY AnnualRevenue DESC LIMIT 5];
    }
    // Challenge V: Write a method called LastBigOpportunity. 
    // This method should return the Opportunity with the most recent Close Date that had an Amount over $100,000.
    public static Opportunity LastBigOpportunity() {
        return [SELECT Name, Amount, CloseDate FROM Opportunity WHERE Amount > 100000 ORDER BY CloseDate DESC LIMIT 1][0];
    }
    // Challenge VI: Write a method called MajorPlayers. 
    // This method should return all Contacts that are associated to an Account with a Rating of Hot.
    public static List<Contact> MajorPlayers () {
        List<Account> accs = [SELECT Name, Rating, (SELECT Name FROM Contacts) FROM Account WHERE Rating = 'Hot'];
        List<Contact> cons = new List<Contact>();
        
        for (Account acc : accs) {
            for (Contact con : acc.Contacts) {
                cons.add(con);
            }
        }
        
        return cons;
    }


    // Challenge VII: Write a method called MostPopularAccount. 
    // This method should return the Account Name that has the most associated Contacts.
    public static String MostPopularAccount(){
        AggregateResult result = [SELECT Account.Name FROM Contact WHERE Account.Name != '' GROUP BY Account.Name ORDER BY count(ID) DESC LIMIT 1];
        return (String)result.get('Name');
    }
}