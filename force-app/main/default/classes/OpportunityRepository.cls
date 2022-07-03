/**
 * @author Antônio Moura
 */
public virtual class OpportunityRepository {

    virtual
    public List<Opportunity> findByCpfOrCnpj(String cpf, String cnpj) {
        return [SELECT Id, Name, Cpf__c, Cnpj__c FROM Opportunity WHERE (Cpf__c = : cpf OR Cnpj__c = : cnpj) AND (Cpf__c != NULL OR Cnpj__c != NULL)];
    }
}
