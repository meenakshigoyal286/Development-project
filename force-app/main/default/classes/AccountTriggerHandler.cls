public class AccountTriggerHandler{
    public static void ChangeOwnerTrigger(List<Account> lstofAccounts,map<Id,Account> oldMap){
        Set<Id> SetofaccountIds = new Set<Id>();
        Map<Id,String> NewMap = new Map<Id,String>();
        for(Account objaccount: lstofAccounts){
            if(objaccount.OwnerId!= oldMap.get(objaccount.Id).OwnerId){
                NewMap.put(objaccount.Id, objaccount.OwnerId);
            }
        }
        List<Contact> lstofcontacts = new List<Contact>();
       {
            for(Contact objcontact : [select id , OwnerId ,accountid, name from  Contact where accountid in:NewMap.KeySet()]){
                if(NewMap.containsKey(objcontact.accountid)){
                    objcontact.Account_Managers__c= NewMap.get(objcontact.accountid);
                }
                lstofcontacts.add(objcontact);
            }
        }
        try{
            if(lstofcontacts.size()>0){
                Update lstofcontacts;
            }
        }
        catch(Exception e){
            System.debug(e.getmessage());
        }
    }
}