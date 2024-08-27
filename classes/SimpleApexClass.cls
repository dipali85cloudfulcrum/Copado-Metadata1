public class SimpleApexClass {
    
    // Method to calculate the average annual revenue of Accounts in the system
    public static void calculateAverageRevenue() {
        // Query Accounts with annual revenue greater than 100,000
        List<Account> accounts = [SELECT Id, Name, AnnualRevenue 
                                  FROM Account 
                                  WHERE AnnualRevenue > 100000];
        // Variable to hold the total revenue
        Decimal totalRevenue = 0;        
        // Loop through each Account and add up the AnnualRevenue
        for (Account acc : accounts) {
            totalRevenue += acc.AnnualRevenue;
        }        
        // Calculate the average revenue
        Decimal averageRevenue = 0;
        if (accounts.size() > 0) {
            averageRevenue = totalRevenue / accounts.size();
        }
        // Log the average revenue for debugging
        System.debug('Average Annual Revenue: ' + averageRevenue);
        System.debug('test debug line');
    }
}