public with sharing class AccountService {
    // Method to get active accounts
    public static List<Account> getActiveAccounts() {
        return [SELECT Id, Name FROM Account WHERE Type = 'Customer'];//test
    }

    // Method to deactivate an account//commit1
    public static void deactivateAccount(Id accountId) {
        Account acc = [SELECT Id, Type FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Type = 'Investor';
        update acc;
    }
}