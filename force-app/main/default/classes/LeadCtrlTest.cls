/**
 * @author Antônio Moura
 */
@isTest
public class LeadCtrlTest {
   
    @isTest
    public static void givenLeadIdWhenFindByIdThenReturnFoundLead() {

        Lead lead = LeadFixtureFactory.newDefaultLead('{ "Id" : "00Q8Z00001engzwUAA", "FirstName" : "Pedro", "LastName" : "Silva", "Company" : "Kolekto", "Cpf__c" : "547.658.451-00", "Cnpj__c" : "14.989.453/0001-05"}');
        
        LeadCtrl.leadRepository = new LeadRepositoryMock(lead);

        Test.startTest();

        Lead foundLead = LeadCtrl.findSelectedLeadCpfCnpj(lead.Id);
        
        Test.stopTest();

        System.assert(foundLead != null);
        System.assertEquals(lead.Id, foundLead.Id);
    }


    @isTest
    public static void givenCpfAndCnpjFromLeadWhenFindLeadsByCnpjAndCnpjThenReturnFoundLeads() {

        Lead lead = LeadFixtureFactory.newLead();

        LeadCtrl.leadRepository = new LeadRepositoryMock(lead);

        Test.startTest();

        List<Lead> foundLeads = LeadCtrl.findLeadsByLeadCpfCnpj(lead.Cpf__c, lead.Cnpj__c);
        
        Test.stopTest();

        System.assert(foundLeads.get(0) != null);
        System.assertEquals(lead.Cpf__c, foundLeads.get(0).Cpf__c);
        System.assertEquals(lead.Cnpj__c, foundLeads.get(0).Cnpj__c);
    }


    @isTest
    public static void givenCpfAndCnpjFromLeadWhenFindAccountsByCnpjAndCnpjThenReturnFoundAccounts() {

        Lead lead = LeadFixtureFactory.newLead();

        Account account = AccountFixtureFactory.newAccount();

        LeadCtrl.accountRepository = new AccountRepositoryMock(account);

        Test.startTest();

        List<Account> foundAccounts = LeadCtrl.findAccountsByLeadCpfCnpj(lead.Cpf__c, lead.Cnpj__c);
        
        Test.stopTest();

        System.assert(foundAccounts.get(0) != null);
        System.assertEquals(lead.Cpf__c, foundAccounts.get(0).Cpf__c);
        System.assertEquals(lead.Cnpj__c, foundAccounts.get(0).Cnpj__c);
    }


    @isTest
    public static void givenCpfAndCnpjFromLeadWhenFindOpportunitiesByCnpjAndCnpjThenReturnFoundOpportunities() {

        Lead lead = LeadFixtureFactory.newLead();

        Opportunity opportunity = OpportunityFixtureFactory.newOpportunity();

        LeadCtrl.opportunityRepository = new OpportunityRepositoryMock(opportunity);

        Test.startTest();

        List<Opportunity> foundOpportunities = LeadCtrl.findOpportunitiesByLeadCpfCnpj(lead.Cpf__c, lead.Cnpj__c);
        
        Test.stopTest();

        System.assert(foundOpportunities.get(0) != null);
        System.assertEquals(lead.Cpf__c, foundOpportunities.get(0).Cpf__c);
        System.assertEquals(lead.Cnpj__c, foundOpportunities.get(0).Cnpj__c);
    }


    public class LeadRepositoryMock extends LeadRepository {

        Lead lead;

        public LeadRepositoryMock(Lead lead) {
            this.lead = lead;
        }

        override
        public Lead findById(String id) {
            return lead;
        }

        override
        public List<Lead> findByCpfOrCnpj(String cpf, String cnpj) {
            return new List<Lead>{lead};
        }
    }


    public class AccountRepositoryMock extends AccountRepository {

        Account account;

        public AccountRepositoryMock(Account account) {
            this.account = account;
        }

        override
        public List<Account> findByCpfOrCnpj(String cpf, String cnpj) {
            return new List<Account>{account};
        }
    }


    public class OpportunityRepositoryMock extends OpportunityRepository {

        Opportunity opportunity;

        public OpportunityRepositoryMock(Opportunity opportunity) {
            this.opportunity = opportunity;
        }

        override
        public List<Opportunity> findByCpfOrCnpj(String cpf, String cnpj) {
            return new List<Opportunity>{opportunity};
        }
    }
}
