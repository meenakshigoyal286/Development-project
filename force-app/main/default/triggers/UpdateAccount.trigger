trigger UpdateAccount on Opportunity (after insert) {
    if(trigger.isInsert){
        set<Id> setOfAccIds = new set<Id>();
        List<Account> lstofAccountIds= new List<Account>();
         for(Opportunity objopp:trigger.new){
            if(objopp.Amount>=50000){
             setOfAccIds.add(objopp.accountId);   
            }
        }
        for(Account acc: [select id,Rating from Account where id in:setOfAccIds]){
            acc.Rating= 'Hot';
            lstofAccountIds.add(acc);
        }
        Update lstofAccountIds;
    }
}