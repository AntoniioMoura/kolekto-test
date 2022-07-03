/**
 * @author Antônio Moura
 */
@isTest
public class AccountRepositoryTest {

    @isTest
    public static void givenCpfAndCnpjWhenFindAccountByCpfOrCnpjthenReturnFoundAccount() {

        AccountRepository respository = new AccountRepository();

        Account account = AccountFixtureFactory.createAccount();

        Test.startTest();

        List<Account> foundAccounts = respository.findByCpfOrCnpj(account.Cpf__c, account.Cnpj__c);

        Test.stopTest();

        Account storedAccount = foundAccounts.get(0);

        System.assert(storedAccount != null);
        System.assertEquals(account.Cpf__c, storedAccount.Cpf__c);
        System.assertEquals(account.Cnpj__c, storedAccount.Cnpj__c);
    }
}
