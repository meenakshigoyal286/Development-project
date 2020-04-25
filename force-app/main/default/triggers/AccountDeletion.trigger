trigger AccountDeletion on Account (before Delete) {
    Set<Id> setofAccIds = new Set<Id>();
    Set<Id> setofAccIds1 = new Set<Id>();
   for(Account objacc: trigger.old){
        setofAccIds.add(objacc.id);
    }
    for(Account objacc: [select id,name,(select id,name from Contacts) from Account where id in:setofAccIds ]){
        if(objacc.Contacts.size()>0){
            setofAccIds1.add(objacc.id);
        }
    }
    for(Account objacc: trigger.old){
        if(setofAccIds1.contains(objacc.Id)){
            objacc.addError('Deletion not allowed');
        }
    } 
}