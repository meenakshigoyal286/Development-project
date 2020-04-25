trigger casestatus on Case (after insert,after update){
    Set<Id> lstofconIds = new Set<Id>();
    List<Contact> lstofcon = new List<Contact>();
    for(Case objcase: trigger.new){
           if(objcase.Status=='Closed'){
            lstofconIds.add(objcase.ContactId);
        }
    }
    for(Contact objcon: [select id,Total_cases__c from Contact where id in:lstofconIds ]){
       objcon.Total_cases__c = string.valueof(Integer.valueof(objcon.Total_cases__c!=null?objcon.Total_cases__c:'0')+1);
        lstofcon.add(objcon);

    }
    if(lstofcon.size()>0)
        update lstofcon;
}