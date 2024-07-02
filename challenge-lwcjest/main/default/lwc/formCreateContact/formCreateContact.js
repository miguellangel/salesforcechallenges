import { LightningElement, track, wire } from 'lwc';
import createContact from '@salesforce/apex/ContactHelper.createContact';
import getAllAccounts from '@salesforce/apex/ContactHelper.getAllAccounts';

export default class FormCreateContact extends LightningElement {

    message;
    error;

    associateAccount = false;
    accounts;
    selectedAccount;


    async handleCreateContact(event) {
        event.preventDefault();
        let formFields = this.template.querySelector('.form').elements;
        
        let contactArgs = {
            firstName: formFields['FirstName'].value,
            lastName: formFields['LastName'].value
        }
        console.log('object: ', contactArgs);
        try {
            this.message = await createContact({wrapper: contactArgs});
            this.error = undefined;
        } catch (error) {
            this.message = undefined;
            this.error = error;
        }

    }

    async handleAssociateAccount() {
        this.associateAccount = !this.associateAccount;
        if (this.associateAccount) {
            await getAllAccounts()
                .then(data => {
                    let options = [];
                    for (let account of data) {
                        options.push({label: account.Name, value: account.Id});
                    }
                    this.accounts = options;
                });
            console.log('getting accounts: ', this.accounts)
        } else {
            this.accounts = undefined;
        }
    }

    handleComboBoxChange(event) {
        this.selectedAccount = event.detail.value;
    }
}