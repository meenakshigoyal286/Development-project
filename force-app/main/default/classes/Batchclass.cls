global class Batchclass implements Database.Batchable<sObject>,Database.stateful{
    List<Account> lstAccountUpdate = new List<Account>();
    Integer i=0;
    String str1='SELECT ID,Name, BillingState ' + 'FROM Account ' +
        'Where BillingCountry = \'USA\' OR BillingCountry=Null';
    String str2='Select ID,Name From Account';
    
    global Database.QueryLocator Start(Database.BatchableContext bc){
        return Database.getQueryLocator(str1);
    }
    global void execute(Database.BatchableContext bc, List<Account> lstAccount){
        for(Account objAccount : lstAccount){
            i=i+1;
            String name=objAccount.Name;
            objAccount.Name=name;
            lstAccountUpdate.add(objAccount);
        }
        try{
            if(lstAccountUpdate.size()>0)
                update lstAccountUpdate;
        }catch(Exception e){
            System.debug('lstAccountUpdate......'+lstAccountUpdate);
        }
    }
    
    global void finish(Database.BatchableContext bc){
        System.debug('Total update record...'+i);
    }
    
}