trigger OpportunityTrigger on Opportunity (before insert,before update) {
    for(Opportunity objopp: trigger.new){
        if(objopp.StageName=='Closed Won')
            objopp.CloseDate= Date.today();
        objopp.Type ='New Customer';
            
    }
}