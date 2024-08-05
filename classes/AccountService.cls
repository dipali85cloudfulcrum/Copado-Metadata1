public with sharing class AccountService {
    // Method to get active accounts
    public static List<Account> getActiveAccounts() {
        return [SELECT Id, Name FROM Account WHERE Type = 'Customer'];
    }

    // Method to deactivate an account
    public static void deactivateAccount(Id accountId) {
        Account acc = [SELECT Id, Type FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Type = 'Investor';
        update acc;
    }
}