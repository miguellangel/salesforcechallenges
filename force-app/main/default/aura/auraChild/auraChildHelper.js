({
    fireEvents : function(component, event) {

        if(event.currentTarget.title == 'Add Task!') {
            var compEvent = component.getEvent("compEvent");
            
            var newTask = document.querySelector('#newTaskInput');

            compEvent.setParams({"exampleParam" : newTask.value});
            compEvent.fire();
        }
    }
})
