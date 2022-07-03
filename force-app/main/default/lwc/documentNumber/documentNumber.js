import { api, LightningElement } from 'lwc';
import findSelectedLeadCpfCnpj from '@salesforce/apex/LeadCtrl.findSelectedLeadCpfCnpj';
import findAccountsByLeadCpfCnpj from '@salesforce/apex/LeadCtrl.findAccountsByLeadCpfCnpj';
import findLeadsByLeadCpfCnpj from '@salesforce/apex/LeadCtrl.findLeadsByLeadCpfCnpj';
import findOpportunitiesByLeadCpfCnpj from '@salesforce/apex/LeadCtrl.findOpportunitiesByLeadCpfCnpj';

export default class DocumentNumber extends LightningElement {

    cpf = '';
    cnpj = '';
    accounts;
    leads;
    opportunities;

    @api
    get recordId() {
        return this._recordId;
    }

    set recordId(value) {
        this._recordId = value;
    }

    connectedCallback() {
        this.findCpfCnpjForLead();
    }


    findCpfCnpjForLead() {

        findSelectedLeadCpfCnpj({leadId : this._recordId}).then(result => {

            this.cpf = result.Cpf__c;
            this.cnpj = result.Cnpj__c;

            this.findAccounts();
            this.findLeads();
            this.findOpportunities()

        }).catch(error => {
            console.log('error: ' + error);
        })
    }


    findAccounts() {
        findAccountsByLeadCpfCnpj({cpf : this.cpf, cnpj : this.cnpj}).then(result => {
            if (result) {
                result.forEach(item => item['AccountURL'] = '/lightning/r/Account/' + item['Id'] + '/view');
            }
            this.accounts = [...result];
        }).catch(error => {
            console.log('error: ' + error);
        })
    }


    findLeads() {
        findLeadsByLeadCpfCnpj({cpf : this.cpf, cnpj : this.cnpj}).then(result => {
            if (result) {
                result.forEach(item => item['LeadURL'] = '/lightning/r/Lead/' + item['Id'] + '/view');
            }
            this.leads = [...result];
        }).catch(error => {
            console.log('error: ' + error);
        })
    }


    findOpportunities() {
        findOpportunitiesByLeadCpfCnpj({cpf : this.cpf, cnpj : this.cnpj}).then(result => {
            if (result) {
                result.forEach(item => item['OpportunityURL'] = '/lightning/r/Opportunity/' + item['Id'] + '/view');
            }
            this.opportunities = [...result];
        }).catch(error => {
            console.log('error: ' + error);
        })
    }
     
}