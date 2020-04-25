@isTest
public class Accountcreatehandler_Test {
	@isTest
    public static void unitTest(){
    	Account acc = new Account();
        acc.Name = 'Test';
        insert acc;
        acc.Name = 'test23';
        update acc;
    }
}