import { LightningElement, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import createContact from '@salesforce/apex/ContactHelper.createContact';
import getAllAccounts from '@salesforce/apex/ContactHelper.getAllAccounts';

export default class FormCreateContact extends LightningElement {

    message;
    error;

    associateAccount = false;
    accounts;
    selectedAccount;


    
    async getAccountsForComboBox() {
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
    
    showSuccessToast() {
        const event = new ShowToastEvent({
            title: 'Success',
            message:
                'Contact created successfully',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
    }
    showErrorToast() {
        const event = new ShowToastEvent({
            title: 'Something went wrong',
            message:
                'Could not create Contact. Make sure at least last name field is filled.',
        });
        this.dispatchEvent(event);
    }

    async handleCreateContact(event) {
        event.preventDefault();
        let formFields = this.template.querySelector('.form').elements;
        
        let contactArgs = {
            firstName: formFields['FirstName'].value,
            lastName: formFields['LastName'].value,
            accountId: this.selectedAccount
        }
        try {
            this.message = await createContact({wrapper: contactArgs});
            this.error = undefined;
            console.log("successful execution");
            this.showSuccessToast();
            return 'success';
        } catch (error) {
            console.log('error encountered');
            this.message = undefined;
            this.error = error;
            const event = new ShowToastEvent({
                title: 'Something went wrong',
                message:
                    'Could not create Contact. Make sure at least last name field is filled.',
            });
            this.dispatchEvent(event);
            return 'error';
        }
    }
}