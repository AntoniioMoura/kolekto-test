/**
 * @author Antônio Moura
 */
public with sharing class LeadCtrl {
   
    public static AccountRepository accountRepository;
    
    public static LeadRepository leadRepository;

    public static OpportunityRepository opportunityRepository;

    static {
        accountRepository = new AccountRepository();
        leadRepository = new LeadRepository();
        opportunityRepository = new OpportunityRepository();
    }

    @AuraEnabled
    public static Lead findSelectedLeadCpfCnpj(String leadId) {

        return leadRepository.findById(leadId);
    }

    @AuraEnabled
    public static List<Lead> findLeadsByLeadCpfCnpj(String cpf, String cnpj) {

        return leadRepository.findByCpfOrCnpj(cpf, cnpj);
    }

    @AuraEnabled
    public static List<Account> findAccountsByLeadCpfCnpj(String cpf, String cnpj) {

        return accountRepository.findByCpfOrCnpj(cpf, cnpj);
    }

    @AuraEnabled
    public static List<Opportunity> findOpportunitiesByLeadCpfCnpj(String cpf, String cnpj) {

        return opportunityRepository.findByCpfOrCnpj(cpf, cnpj);
    }
}
