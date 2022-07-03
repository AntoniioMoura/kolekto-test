/**
 * @author Antônio Moura
 */
@isTest
public class OpportunityRepositoryTest {
    
    @isTest
    public static void givenCpfAndCnpjWhenFindOpportunityByCpfOrCnpjthenReturnFoundOpportunity() {

        OpportunityRepository respository = new OpportunityRepository();

        Opportunity opportunity = OpportunityFixtureFactory.createOpportunity();

        Test.startTest();

        List<Opportunity> foundOpportunities = respository.findByCpfOrCnpj(opportunity.Cpf__c, opportunity.Cnpj__c);

        Test.stopTest();

        Opportunity storedOpportunity = foundOpportunities.get(0);

        System.assert(storedopportunity != null);
        System.assertEquals(opportunity.Cpf__c, storedOpportunity.Cpf__c);
        System.assertEquals(opportunity.Cnpj__c, storedOpportunity.Cnpj__c);
    }

}
