trigger CountCreate2 on Contact (after insert,after update,after delete,after undelete) {
    if(trigger.isInsert){
        Set<Id> lstacc= new Set<Id>();
        List<Account> lstaccounts = new List<Account>();
        
        for(Contact objcon: trigger.new)
        {
            if(objcon.accountid!=null)
            {
                lstacc.add(objcon.accountid);
                
            }
        }
        for(Account objacc:[select id ,(select id, name from contacts) from Account  where id in:lstacc]){
           objacc.counter__c = string.valueof(objacc.contacts.size());
           lstaccounts .add(objacc);
            
        }
        if(lstaccounts.size()>0){
            update lstaccounts;
        }
    }

}