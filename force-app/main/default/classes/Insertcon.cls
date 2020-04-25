public class Insertcon {
    public static void createContact(List<Contact> contactlist){
        List<Account> lstacc= new List<Account>();
        if(!contactlist.isEmpty()){
            for(Contact obj:contactlist){
                string email=obj.email;
                string domain= email.substringBetween('@','.');
                System.debug(domain);
                Account acc=[Select id from Account where name=:domain];
                    if(acc==null){
                        Account accs=new Account();
                        accs.name='domain';
                        lstacc.add(accs);
                    }
            }
        }
        insert lstacc;
    }
}