public class createcontacthandler {
    public static void insertContact(List<Contact> Contactlist){
        list<Account> lstAcc= new list<Account>();
        list<Contact> lstCon= new list<Contact>();
        if(!Contactlist.isEmpty()){
            for(Contact obj:Contactlist){
                string email = obj.email;
                string domain = email.substringBetween('@', '.');
                system.debug('===Domain==='+domain);
                Account acc = [select id from account where name=:domain];
                if(acc==null){
                    Account acc1 = new Account();
                    acc1.Name = domain;
                    lstAcc.add(acc1);
                    obj.accountId = acc1.Id;
                    lstCon.add(obj);
                }else{
                    obj.accountId = acc.Id;
                    lstCon.add(obj);
                }
            }
        }   
        insert lstAcc;
        Update lstCon;
        
    }
}