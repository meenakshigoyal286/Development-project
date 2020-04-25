trigger erroronopportunity on Opportunity (after insert) {
    if(trigger.isInsert){
        List<Opportunity> lstopp= new List<Opportunity>();
        List<Opportunity> lstofopp = new List<Opportunity>();
        for(Opportunity objopp:trigger.new){
            if(objopp.Amount<=50000){
                objopp.Account.Rating='Hot';
                lstofopp.add(objopp);
            }
        }
        update lstofopp;
             
    }
}