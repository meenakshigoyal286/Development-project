trigger RollUpTrigger on Contact (After insert,after update) {
    if(trigger.isInsert || trigger.isUPdate){
        Set<Id> SetofIds = new Set<Id>();
        for(Contact objcon: trigger.new){
            if(objcon.AccountId!=null){
            SetofIds.add(objcon.id);
        }
        }
        List<Account> lstofContacts = new  List<Account>();
        for(Account objacc: [select id,No_of_Employee__c,(select id from Contacts) from Account where id in:  SetofIds ]){
            objacc.No_of_Employee__c= objacc.Contacts.size();
            lstofContacts.add(objacc);
        }
      Update lstofContacts;
    }
}