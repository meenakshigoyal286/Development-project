public class ContactCreateHnadler {
    public static void CreateContact(List<Account> lstofAccids,map<Id,Account> oldMap){
        Set<Id> setofEmp = new Set<Id>();
    for(Account objacc:lstofAccids){
        if(trigger.isInsert){
            setofEmp.add(objacc.Id);
        }else if(trigger.isUpdate){
            if(oldMap.get(objacc.Id).No_of_Employee__c !=objacc.No_of_Employee__c){
                setofEmp.add(objacc.Id);
            }
        }
    }
    List<Contact> lstofcontacts = new List<Contact>();
    for(Account acc:[select id,name,No_of_Employee__c,(select id from Contacts) from account where id in:setofEmp]){
        integer temp;
        temp= Integer.valueof(acc.No_of_Employee__c-acc.Contacts.size());
        
        for(Integer i=0;i< temp ;i++){
            Contact con= new Contact();
            con.lastName = 'Contact for'+acc.Name+' '+i;
            con.AccountId= acc.Id;
            lstofcontacts.add(con);
        }
    }
    try{
    insert lstofcontacts;
    }
    catch(Exception e){
        System.debug(e.getMessage());
    }
}
    }