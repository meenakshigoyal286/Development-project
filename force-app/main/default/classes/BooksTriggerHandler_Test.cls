@istest
public class BooksTriggerHandler_Test {
    @istest
    public static void unitTest(){
        Book_users__c cs = new Book_users__c();
        cs.Name = '4';
        insert cs;
        Boooks__c objBooks = new Boooks__c();
        objBooks.Name = 'Biology';
        objBooks.Price__c = 210;
        objBooks.Actual_Price__c = 560;
        insert objBooks;
        
    }
}