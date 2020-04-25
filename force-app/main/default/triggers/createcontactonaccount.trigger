trigger createcontactonaccount on Account (after insert,after update) {
    createcontactonaccountHnadler.CreateContact(trigger.new,trigger.oldMap);
        
    }