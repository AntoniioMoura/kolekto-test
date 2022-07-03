/**
 * @author Antônio Moura
 */
@isTest
public class LeadRepositoryTest {

    @isTest
    public static void givenLeadIdWhenFindByLeadIdThenReturnFoundLead() {
        
        LeadRepository respository = new LeadRepository();

        Lead lead = LeadFixtureFactory.createLead();

        Test.startTest();

        Lead foundLead = respository.findById(lead.Id);

        Test.stopTest();

        System.assert(foundLead != null);
        System.assertEquals(lead.Id, foundLead.Id);
    }

    @isTest
    public static void givenCpfAndCnpjWhenFindLeadByCpfOrCnpjthenReturnFoundLead() {

        LeadRepository respository = new LeadRepository();

        Lead lead = LeadFixtureFactory.createLead();

        Test.startTest();

        List<Lead> foundLeads = respository.findByCpfOrCnpj(lead.Cpf__c, lead.Cnpj__c);

        Test.stopTest();

        Lead storedLead = foundLeads.get(0);

        System.assert(storedLead != null);
        System.assertEquals(lead.Cpf__c, storedLead.Cpf__c);
        System.assertEquals(lead.Cnpj__c, storedLead.Cnpj__c);
    }
}
