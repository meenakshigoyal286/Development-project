global class updateAllOpptoday implements Database.Batchable<SObject>, Database.Stateful{
    
    
    List<Opportunity> listRecords = new List<Opportunity>();
    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'Select Id, Name,OwnerId, CreatedById From Opportunity limit 1000';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<SObject> scope){
        
        for(Opportunity obj : (Opportunity[]) scope){
            
            obj.Description= obj.OwnerId+''+obj.CreatedById;
            listRecords.add(obj);
            
        }
        
    }
    
    global void finish(Database.BatchableContext BC){
        system.debug('list to be deleted size  :: '+listRecords.size());
        if(!listRecords.isEmpty())
        {
            update listRecords;
        }
    }
}