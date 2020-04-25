public class ContactInsertHandler {
public static void InsertCon(List<Account> lstofacc){
List<Contact> lstofcon = new List<Contact>();
Set<Id> setofids = new Set<Id>();
    for(Account objacc : lstofacc){
    Contact con = new Contact();
     con.LastName='360smscloud';
     lstofcon.add(con);
     setofids.add(objacc.id);
    }
    List<Account> lstofACCIDS = new List<Account>();
    for(Account acc: [select id,name,(select id from Contacts) from Account where id in:setofids]){
    	acc.Primary__c=TRUE;
        lstofACCIDS.add(acc);
    }
    try{
    	if(lstofcon.size()>0){
    		insert lstofcon;
    	}
    	if(lstofACCIDS.size()>0){
    		update lstofACCIDS;
    	}
    	}
    	catch(Exception e){
    		System.debug(e.getmessage());
    	}
        }

}