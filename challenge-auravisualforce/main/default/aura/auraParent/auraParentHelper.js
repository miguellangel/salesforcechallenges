({
    logEvent : function(cmp, evt) {
        let TaskList = cmp.get('v.eventMessage'); // []

        var message = evt.getParam('exampleParam');
        
        if (message != null) TaskList.push(message);

        console.log(TaskList);

        cmp.set('v.eventMessage', TaskList);
    },
    componentLoaded : function(cmp, evt) {
        console.log('component has fully loaded into the DOM...');
    }
})