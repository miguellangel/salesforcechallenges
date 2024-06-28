({
    eventHandler : function(component, event, helper) {
        helper.logEvent(component, event);
    },

    doInit : function(component, event, helper) {
        helper.logEvent(component, event);
    },

    logEvent : function(component, event) {
        console.log('event: ' + event.getName());
    }

})