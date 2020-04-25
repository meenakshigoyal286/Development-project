trigger CountofContact on Contact (after insert, after update, after delete, after undelete) {
    Set<Id> setofAccIds = new Set<Id>();
    List<Account> lstofAccIds = new List<Account>();
    for(Contact objcon: trigger.new){
        if(objcon.AccountId!=null){
            setofAccIds.add(objcon.AccountId);
        }
    }
    for(Account objacc:[select id,name from Account where id in:setofAccIds]){
        objacc.Counter__c+=1;
        lstofAccIds.add(objacc);
    }
    if(lstofAccIds.size()>0)
        insert lstofAccIds;
}