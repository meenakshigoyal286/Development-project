trigger ContactasAccountPhone on Contact (after insert, after update) {
          Set<id> setofAccIds = new Set<id>();
        for(Contact objcon:trigger.new){
            if(objcon.AccountId!=null){
               setofAccIds.add(objcon.AccountId);
            }
        }
       Map<Id,Account> mapOfAccounts = new Map<Id,Account>([Select id,name From Account Where id 
                                    IN : setofAccIds]);
  List<Contact> lstofCON = new List<Contact>();
        for(Contact objcon: trigger.new){
            if(mapOfAccounts.containsKey(objcon.Accountid)){
                objcon.OtherPhone = mapOfAccounts.get(objcon.Accountid).Phone;
                lstofCON.add(objcon);
            }
        }
                                        
    update lstofCON;
}