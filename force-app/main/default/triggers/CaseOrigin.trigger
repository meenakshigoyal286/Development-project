trigger CaseOrigin on Case (before insert) {
    if(trigger.isInsert){
        for(Case objcase: trigger.new){
            if(objcase.Origin=='Email'){
                objcase.Status='Escalated';  
                objcase.Priority='High';
            }
        }
        
    }
}