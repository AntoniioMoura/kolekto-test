/**
 * @author Antônio Moura
 */
@isTest
public class OpportunityFixtureFactory {
    
    public static Opportunity newOpportunity(String name, Date closeDate, String stage, String cpf, String cnpj) {
        return new Opportunity(
            Name = name,
            CloseDate = closeDate,
            StageName = stage,
            Cpf__c = cpf,
            Cnpj__c = cnpj
        );
    }

    public static Opportunity newOpportunity() {
        return new Opportunity(
            Name = 'Venda de automovel',
            CloseDate = Date.today().addDays(20),
            StageName = 'Prospecting',
            Cpf__c = '547.658.451-00',
            Cnpj__c = '14.989.453/0001-05'
        );
    }

    public static Opportunity createOpportunity(String name, Date closeDate, String stage, String cpf, String cnpj) {
        return createOpportunity(newOpportunity(name, closeDate, stage, cpf, cnpj));
    }

    public static Opportunity createOpportunity() {
        return createOpportunity(newOpportunity());
    }

    public static Opportunity createOpportunity(Opportunity opportunity) {
        upsert opportunity;
        return opportunity;
    }
}
