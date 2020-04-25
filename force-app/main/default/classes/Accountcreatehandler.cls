public class Accountcreatehandler {
    public static void accountInsert(List<Account> acc){
       List<Contract> lstOfContracts = new List<Contract>();
       if(!acc.isEmpty()){
           for(Account obj:acc) {
               Contract c = new Contract();
               c.AccountId = obj.id;
               //c.Status='Activated';
               lstOfContracts.add(c);
           }  
       }
       if(!lstOfContracts.isEmpty()){
        insert lstOfContracts;
       }
    }
}