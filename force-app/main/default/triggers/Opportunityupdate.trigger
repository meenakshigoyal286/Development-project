trigger Opportunityupdate on Opportunity (before insert,before update) {
   // if(Trigger.isInsert){
        List<Opportunity> lstopp= new List<Opportunity>();
         for(Opportunity objopp: trigger.new)
         {
             if(objopp.amount>50000){
                 objopp.Primary__c =true;
             }
         }
    //}
}