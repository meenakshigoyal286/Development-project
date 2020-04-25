public class BooksTriggerHandler{
    public static void Updateprice(List<Boooks__c> lstofBooks){
        if(trigger.isInsert){
            // map<Decimal,Book_users__c> newSubjectMap = new map<Decimal,Book_users__c>();
            Decimal ObjCustom = Integer.valueof(Book_users__c.getAll().values()[0].Name);
            System.debug('custom setting'+ObjCustom);
            for(Boooks__c objbooks : lstofBooks){
                if(objbooks.Price__c!=null){
                    objbooks.Price__c= (objbooks.Actual_Price__c*ObjCustom)/100;
                    System.debug('price is'+objbooks.Price__c);
                }
            }
        }
    }
    
}