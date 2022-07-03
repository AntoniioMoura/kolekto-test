/**
 * @author Antônio Moura
 */
@isTest
public class AccountFixtureFactory {
    
    public static Account newAccount(String name, String cpf, String cnpj) {
        return new Account(
            Name = name,
            Cpf__c = cpf,
            Cnpj__c = cnpj
        );
    }

    public static Account newAccount() {
        return new Account(
            Name = 'Pedro',
            Cpf__c = '547.658.451-00',
            Cnpj__c = '14.989.453/0001-05'
        );
    }

    public static Account createAccount(String name, String cpf, String cnpj) {
        return createAccount(newAccount(name, cpf, cnpj));
    }
 
    public static Account createAccount() {
        return createAccount(newAccount());
    }
    
    public static Account createAccount(Account account) {
        upsert account;
        return account;
    }

}
