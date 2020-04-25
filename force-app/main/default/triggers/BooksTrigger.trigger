trigger BooksTrigger on Boooks__c (before insert) {
 BooksTriggerHandler.Updateprice(trigger.new);
    //
    //BooksClass.OnafterUpdate(trigger.new,trigger.oldmap);
}