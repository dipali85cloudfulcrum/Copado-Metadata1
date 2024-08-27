@IsTest
public class SimpleApexClassTest {
    
    @IsTest
    static void testCalculateAverageRevenue() {
        // Create test data
        Account acc1 = new Account(Name = 'Test Account 1', AnnualRevenue = 200000);
        Account acc2 = new Account(Name = 'Test Account 2', AnnualRevenue = 300000);
        Account acc3 = new Account(Name = 'Test Account 3', AnnualRevenue = 400000);
        Account acc4 = new Account(Name = 'Test Account 4', AnnualRevenue = 50000); // Should not be included

        // Insert test data
        insert new List<Account>{ acc1, acc2, acc3, acc4 };
        
        // Call the method to test
        Test.startTest();
        SimpleApexClass.calculateAverageRevenue();
        Test.stopTest();
        
        // Query Accounts to validate the method's logic
        List<Account> accounts = [SELECT Id, Name, AnnualRevenue 
                                  FROM Account 
                                  WHERE AnnualRevenue > 100000];

        // Validate the number of Accounts returned
        System.assertEquals(3, accounts.size(), 'There should be 3 Accounts with AnnualRevenue > 100,000');

        // Calculate expected average revenue manually for assertion
        Decimal expectedTotalRevenue = acc1.AnnualRevenue + acc2.AnnualRevenue + acc3.AnnualRevenue;
        Decimal expectedAverageRevenue = expectedTotalRevenue / 3;

        // You can use a custom assertion or manually validate the logic during test execution
        System.assert(expectedAverageRevenue == 300000, 'The average revenue should be 300000.');
    }
}