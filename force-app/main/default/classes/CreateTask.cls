Public class CreateTask{
public static void CreateTask1(List<Contract_overview__c> lstofContractsStatus){
        List<Task> TaskList = new List<Task>();
        for(Contract_overview__c objContract: lstofContractsStatus ){
            if(objContract.Status_on_Contract__c!=null){
                Date d1 = objContract.Created_Date__c;
                integer month= d1.month();
                integer year = d1.year();
                integer day = d1.day();
                if(day==1){
                    DateTime d = DateTime.newInstance(Year,month,01);
                    system.debug(d);
                    Task NewTask = new Task();
                    NewTask.Subject='Project Task';
                    NewTask.WhatID = objContract.Id;
                    NewTask.ActivityDate =Date.valueof(d);
                    System.debug('actiity date'+NewTask);
                    TaskList.add(NewTask);
                    
                }
                else if(day>1){
                    
                    DateTime d = DateTime.newInstance(Year,(month+1),01);
                    system.debug(d);
                    Task NewTask = new Task();
                    NewTask.Subject='Project Task';
                    NewTask.WhatID = objContract.Id;
                    NewTask.ActivityDate =Date.valueof(d);
                    System.debug('actiity date'+NewTask);
                    TaskList.add(NewTask);
                    
                }
            }try{
                if(TaskList.size()>0){
                    insert TaskList;
                    System.debug('tasklist'+Tasklist);
                }
            }
            catch(Exception e){
                System.debug(e.getmessage());
            }
        }
    }
}