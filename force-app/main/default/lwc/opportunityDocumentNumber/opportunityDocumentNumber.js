import { api, LightningElement } from 'lwc';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'CPF', fieldName: 'Cpf__c' },
    { label: 'CNPJ', fieldName: 'Cnpj__c'},
    { label: 'Actions', fieldName: 'OpportunityURL', type: 'url', typeAttributes: {label : 'View details', target: '_blank'}},
];

export default class OpportunityDocumentNumber extends LightningElement {

    @api opportunities;
    columns = columns;
}