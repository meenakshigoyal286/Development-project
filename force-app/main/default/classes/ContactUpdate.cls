public class ContactUpdate{
    public static void WebsiteProfile(List<Account> lstofAccount , Map<Id,Account> OldMapAccount){
        Map<Id,Account> NewMap = new Map<Id,Account>();
        for(Account objAccount : lstofAccount){
            if(objAccount.Website !=OldMapAccount.get(objAccount.Id).Website ){
                NewMap.put(objAccount.Id,objAccount);
            }
        }
        List<Contact> lstofContact = new List<Contact>();
        for(Contact objcontact:[select id,Profile__c from Contact where accountid in:NewMap.keyset() ]){
            objcontact.Profile__c	 = NewMap.get(objcontact.accountId).Website+'/'+objcontact.LastName;
            lstofContact.add(objcontact);
        }
        try{
            if(lstofContact.size()>0)
                Update lstofContact;
        }
        catch(Exception e){
            System.debug(e.getmessage());
        }
    }
}