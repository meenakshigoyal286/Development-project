trigger OpportunityRATING on Opportunity (after insert,after update) {
    Set<Id> setofOppIds = new Set<Id>();
    List<Account> lstofAccounts = new List<Account>();
    for(Opportunity objopp: trigger.new){
        if(objopp.StageName=='Closed Won'){
            setofOppIds.add(objopp.Id);
        }
    }
    for(Account objacc: [Select id,name from Account where id in: setofOppIds]){
        objacc.Rating='Hot';
         lstofAccounts.add(objacc);
    }
    
    if(lstofAccounts.size()>0)
        insert lstofAccounts;
    
}