import { LightningElement, track, wire } from 'lwc';
import createContact from '@salesforce/apex/ContactHelper.createContact';

export default class FormCreateContact extends LightningElement {

    message;
    error;

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

}