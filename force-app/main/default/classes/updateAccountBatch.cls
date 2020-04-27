global class updateAccountBatch Implements Schedulable
{
    global void execute(SchedulableContext sc){
        
        List<Account> listofAccount = new List<Account>();
        listofAccount = [SELECT ID,name,Description FROM Account ];
        
        for(Account objacc : listofAccount)
        {
            objacc.Description = 'Updated'
        }
        
        update listofAccount;
    }
}