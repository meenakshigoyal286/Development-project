trigger CaseAssignment on Case (before insert,before update) {
    if(trigger.isInsert){
        Group DesignRequested =[select Id,name from Group where Name='Design Requested' and Type = 'Queue'];
         Group ManagerQueue =[select Id,name from Group where Name='Manager queue' and Type = 'Queue'];

        for(Case objcase: trigger.new){
            if(objcase.Subject=='Design Requested' && objcase.Priority=='High'){
                objcase.OwnerId= DesignRequested.id;
            }
            else if(objcase.Subject=='Design Requested' && objcase.Priority=='High' && objcase.Assign_to_manager__c==True){
                objcase.OwnerId= ManagerQueue.id;
            }
        }
    }
}