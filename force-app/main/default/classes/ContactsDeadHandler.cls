public class ContactsDeadHandler {
    public static void CreateContact(List<Contact> lstofcontacts){
        map<Id,Integer> mapOfAccVsAllContacts = new map<Id,Integer>();
        map<Id,Integer> mapOfAccVsDeadContacts = new map<Id,Integer>();
        for(Contact objcontact: lstofcontacts){
            if(mapOfAccVsAllContacts.containsKey(objcontact.accountId)){
                integer temp = mapOfAccVsAllContacts.get(objcontact.accountId);
                temp++;
                mapOfAccVsAllContacts.put(objcontact.accountId,temp);                
            }else{
                mapOfAccVsAllContacts.put(objcontact.accountId,1);	
            }
            if(objcontact.dead__c==True){
                if(mapOfAccVsDeadContacts.containsKey(objcontact.accountId)){
                    integer temp1 = mapOfAccVsDeadContacts.get(objcontact.accountId);
                    temp1++;
                    mapOfAccVsDeadContacts.put(objcontact.accountId,temp1);                
                }else{
                    mapOfAccVsDeadContacts.put(objcontact.accountId,1);	
                }
            }
        }
        List<Account> lstacc = new List<Account>();
        for(Account accid: [select id from Account where id in:mapOfAccVsAllContacts.keyset()]){
            Decimal perc = (mapOfAccVsDeadContacts.get(accid.Id)/ mapOfAccVsAllContacts.get(accid.Id))*100;
            if(perc>70){
                accid.need_intel__c = TRUE;
                lstacc.add(accid);
            }
        }
        try{
            if(lstacc.size()>0){
                Update lstacc;
            }
        }catch(Exception e){
            System.debug(e.getmessage());
        }
    }
}