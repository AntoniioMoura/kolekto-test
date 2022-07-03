/**
 * @author Antônio Moura
 */
@isTest
public class LeadFixtureFactory {
    
    public static Lead newLead(String firstName, String lastName, String company, String cpf, String cnpj) {
        return new Lead(
                FirstName = firstName,
                LastName = lastName,
                Company = company,
                Cpf__c = cpf, 
                Cnpj__c = cnpj
                );
    }

    public static Lead newLead() {
        return new Lead(
                FirstName = 'Pedro',
                LastName = 'Silva',
                Company = 'Kolekto',
                Cpf__c = '547.658.451-00', 
                Cnpj__c = '14.989.453/0001-05'
            );
    }

    public static Lead newDefaultLead(String payload) {
        return (Lead) JSON.deserialize(payload, Lead.class);
    }

    public static Lead createLead(String firstName, String lastName, String company, String cpf, String cnpj) {
        return (createLead(newLead(firstName, lastName, company, cpf, cnpj)));
    }
    
    public static Lead createLead() {
        return (createLead(newLead()));
    }

    public static Lead createLead(Lead lead) {
        upsert lead;
        return lead;
    }

}
