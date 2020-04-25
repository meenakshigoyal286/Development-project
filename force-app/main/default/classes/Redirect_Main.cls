public class Redirect_Main {

    public List<Account> accs {set;get;}

    public void access(){
        accs = [select id,name,Industry from account];

    }
}