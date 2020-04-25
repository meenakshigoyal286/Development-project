public class AccountWrapDetails {
    public AccountWrapDetails(){
        
    }
    public void getAccounts(){
        integer i = 0;
        list<Wrapper> wraplst = new list<Wrapper>();
        for(Account acc:[select id,name,Rating,(select id from contacts),(select id from Opportunities) from account]){
            i++;
            wraplst.add(new Wrapper(i,acc.Name,acc.Rating,acc.contacts.size(),acc.Opportunities.size()));
        }
        system.debug('===wraplst===='+wraplst);
    }
    public class Wrapper{
        public integer serialno;
        public string accName;
        public string rating;
        public Integer noOfContacts;
        public Integer noOfOpp;
        public Wrapper(integer serialno1,string accName1,string rating1,Integer noOfContacts1,Integer noOfOpp1){
            this.accName = accName1;
            this.rating = rating1;
            this.noOfContacts = noOfContacts1;
            this.noOfOpp = noOfOpp1;
            this.serialno = serialno1;
        }
    }
}