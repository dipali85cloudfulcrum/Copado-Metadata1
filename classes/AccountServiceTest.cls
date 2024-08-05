@isTest
private class AccountServiceTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            accounts.add(new Account(Name = 'Test Account ' + i, Type = 'Customer'));
        }
        insert accounts;
    }

    @isTest
    static void testGetActiveAccounts() {
        Test.startTest();
        List<Account> activeAccounts = AccountService.getActiveAccounts();
        Test.stopTest();

        System.assertNotEquals(0, activeAccounts.size(), 'Active accounts should be returned.');
        for (Account acc : activeAccounts) {
            System.assertEquals('Customer', acc.Type, 'Account type should be Customer.');
        }
    }

    @isTest
    static void testDeactivateAccount() {
        // Get one active account to deactivate
        Account acc = [SELECT Id, Type FROM Account WHERE Type = 'Customer' LIMIT 1];
        
        Test.startTest();
        AccountService.deactivateAccount(acc.Id);
        Test.stopTest();

        // Verify the account type is updated to Investor
        Account updatedAcc = [SELECT Id, Type FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Investor', updatedAcc.Type, 'Account type should be Investor.');
    }
}