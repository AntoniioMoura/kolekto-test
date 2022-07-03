/**
 * @author Antônio Moura
 */
public virtual class LeadRepository {
    
    virtual
    public Lead findById(String id) {
        return [SELECT Cpf__c, Cnpj__c FROM Lead WHERE Id = : id];
    }

    virtual
    public List<Lead> findByCpfOrCnpj(String cpf, String cnpj) {
        return [SELECT Id, Name, Cpf__c, Cnpj__c FROM Lead WHERE (Cpf__c = : cpf OR Cnpj__c = : cnpj) AND (Cpf__c != NULL OR Cnpj__c != NULL)];
    }
}
