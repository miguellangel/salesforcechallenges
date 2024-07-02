import getAccountsLikeQuery from '@salesforce/apex/AccountHelper.getAccountsLikeQuery';
import { LightningElement, api, wire, track } from 'lwc';

export default class DisplayAccounts_wire extends LightningElement {
    columns = [
        { label: 'Name', fieldName: 'Name', type:'name' },
        { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency' }
    ];

    query;
    accounts;
    error;
    
    @wire(getAccountsLikeQuery, { query: '$query' })
    getAccounts({data, error}) {
        if (data) {
            this.accounts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.accounts = undefined;
        }
    }
    handleClick(e) {
        let inputValue = this.template.querySelector('.query').value;
        if (inputValue.length > 0) this.query = inputValue;
        console.log('searching for: ', this.query);
    }

    handleQueryReset() {
        this.query = undefined;
        this.accounts = undefined;
        this.error = undefined;
        
    }
}