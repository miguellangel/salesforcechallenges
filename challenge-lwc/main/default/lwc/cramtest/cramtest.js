import { LightningElement, wire } from 'lwc';
import getAccountsLikeQuery from '@salesforce/apex/AccountHelper.getAccountsLikeQuery';

export default class Cramtest extends LightningElement {

    columns = [
        {label: 'Name', fieldName: 'Name', type: 'text'},
        {label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency'}
    ]

    query;
    accounts;

    @wire(getAccountsLikeQuery, {query: '$query'})
    getAccounts({data, error}) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            this.error = error;
        }
    }

    handleSearch() {
        this.query = this.template.querySelector('.inputField').value;
    }

}