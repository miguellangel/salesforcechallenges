import { LightningElement } from 'lwc';
import getAccountsLikeQuery from '@salesforce/apex/AccountHelper.getAccountsLikeQuery';

export default class DisplayAccounts_apex extends LightningElement {

    accounts;

    handleImperativeSearch() {
        let inputValue = this.template.querySelector('.query').value;

        getAccountsLikeQuery({query: inputValue})
            .then(result => {
                this.accounts = result;
            })
            .catch(error => {
                this.accounts = undefined;
            });
    }

}