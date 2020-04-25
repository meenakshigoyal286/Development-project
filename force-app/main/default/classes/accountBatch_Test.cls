@istest
public class accountBatch_Test {
    @istest
    public static void unitTest(){
         //List<Account> lstofAccount = new List<Account>();
        //for(Integer i=0;i<200;i++){
		Account acc = new Account();
        acc.Name = 'test';
        acc.Primary__c=TRUE;
          
        
            insert acc;
    
        
 
        Test.startTest();        
        DataBase.executeBatch(new accountBatch(),200);
        Test.stopTest();
        
    }
    
}