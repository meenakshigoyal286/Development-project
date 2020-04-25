public class AccountUserHandler {
    public static void GetAnotherUser(List<Account> lstofAccs){
        for(Account objacc:lstofAccs){
            if(objacc.Industry=='Education') {
                objacc.OwnerId='0052v00000gXss6';
                System.debug(objacc);
            }
        }
    }
}