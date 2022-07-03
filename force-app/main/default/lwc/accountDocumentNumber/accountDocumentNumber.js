import { api, LightningElement } from 'lwc';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'CPF', fieldName: 'Cpf__c' },
    { label: 'CNPJ', fieldName: 'Cnpj__c'},
    { label: 'Actions', fieldName: 'AccountURL', type: 'url', typeAttributes: {label : 'View details', target: '_blank'}},
];

export default class AccountDocumentNumber extends LightningElement {

    @api accounts;
    columns = columns;

}