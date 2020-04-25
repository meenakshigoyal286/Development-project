global class contactsScheduler Implements Schedulable
{
    global void execute(SchedulableContext sc){
        
    
        List<Contact> listContacts = new List<Contact>();
        listContacts = [SELECT ID,Description FROM Contact ];
        
        for(Contact objcon : listContacts)
        {
            objcon.Description = 'Updated';
        }
        
        update listContacts;
    }
}