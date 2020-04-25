//this batch is used for updating checkbox on Account
global class accountBatch implements Database.Batchable<sObject>,Database.stateful{
    List<Account> lstAccountUpdate = new List<Account>();
    integer i=0;
    string str1 = 'select id, name from Account';
    
    global Database.QueryLocator Start(Database.BatchableContext bc){
        return Database.getQueryLocator(str1);
    }
     global void execute(Database.BatchableContext bc, List<Account> lstAccount){
        for(Account objAccount : lstAccount){
            
            i=i+1;
            String name=objAccount.Name;
            objAccount.Primary__c= TRUE;
            lstAccountUpdate.add(objAccount);
        }
         update lstAccountUpdate;
         
}
        global void finish(Database.BatchableContext bc){
        System.debug('Total update record...'+i);
    }
    
}