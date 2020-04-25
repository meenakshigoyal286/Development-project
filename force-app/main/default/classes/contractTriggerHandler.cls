public class contractTriggerHandler{
    public static void createChildRecord (List<Contract_overview__c> lstofContracts , Map<Id,Contract_overview__c> OldMap){
        Set<Id> setofIds = new Set<id>();
        for(Contract_overview__c objContract : lstofContracts){
            if(objContract.Status_on_Contract__c!=null){
                setofIds.add(objContract.Id);
            }
            else if(trigger.isUpdate){
                if(OldMap.get(objContract.Id).Status_on_Contract__c !=objContract.Status_on_Contract__c){
                    setofIds.add(objContract.Id);
                }
            }
            List<Service_on_Contract__c> lstofDeletedRecords = new List<Service_on_Contract__c>();
            List<Service_on_Contract__c> lstofInsertRecords = new List<Service_on_Contract__c>();
            for(Contract_overview__c objCon:[select id ,Status_on_Contract__c,(select id from Service_on_Contracts__r ) from Contract_overview__c where id in:setofIds]){
                system.debug(objCon.Status_on_Contract__c);
                Integer temp = objCon.Status_on_Contract__c.split(';').size()-objcon.Service_on_Contracts__r.Size();
                if(temp<1){
                    Integer temp1 = 0-temp;
                    System.debug('======='+temp1);
                    for(Integer i=0;i<temp1;i++){
                        lstofDeletedRecords.add(objCon.Service_on_Contracts__r[i]);  
                    }
                }
                if(temp>1){
                    for( Integer i=0; i<temp;i++){
                        Service_on_Contract__c objService = new Service_on_Contract__c();
                        objService.Name='text'+i;
                        objService.Contracts__c= objCon.Id;
                        lstofInsertRecords.add(objService);
                    }

                }
            }
            System.debug(lstofDeletedRecords);
            try{
                if(lstofInsertRecords.size()>0){
                    insert lstofInsertRecords;
                }
                
                if(lstofDeletedRecords.size()>0)
                    delete lstofDeletedRecords;
            }
            catch(Exception e){
                System.debug(e.getmessage());
            }
            
        }
        
    }
}