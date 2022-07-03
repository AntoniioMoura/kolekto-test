import { api, LightningElement } from 'lwc';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'CPF', fieldName: 'Cpf__c' },
    { label: 'CNPJ', fieldName: 'Cnpj__c'},
    { label: 'Actions', fieldName: 'LeadURL', type: 'url', typeAttributes: {label : 'View details', target: '_blank'}},
];

export default class LeadDocumentNumber extends LightningElement {

    @api leads;
    columns = columns;

}