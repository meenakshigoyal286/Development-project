trigger Orphancontact on Contact (after insert, after update) {
        List<Contact> lstofcon = new List<Contact>();
        map<string,Contact> mapOfContact = new map<string,Contact>();
    	set<string> websites = new set<string>();
        for(Contact objcon : trigger.new){
            if(objcon.AccountId==null && objcon.Rating__c!=''){
                websites.add('www'+objcon.Email.substringBetween('@','.')+'.com');
                //mapOfContact.put(objcon.Email.substringBetween('@','.'),objcon);
            }
            
        }
        for(Account objacc: [select id,Sites__c,Ratingtext__c from Account]){
            string domain = objacc.Sites__c!=null?objacc.Sites__c.substringBetween('@','.'):'';
            system.debug('===domain===='+domain);
            if(mapOfContact.containsKey(domain)){
                if(mapOfContact.get(domain).Rating__c == objacc.Ratingtext__c){
                    Contact con = new Contact();
                    con.Id= mapOfContact.get(domain).Id;
                    con.AccountId = objacc.Id;
                    lstofcon.add(con);
                }
            }
            
        }
        if(lstofcon.size()>0){
            update lstofcon;
        }
}