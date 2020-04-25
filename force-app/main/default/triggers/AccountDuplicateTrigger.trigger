trigger AccountDuplicateTrigger on Account (before insert,before update) {
    Set<Account> setofAccIds = new Set<Account>();
    list<string> lst = new list<string>();
    for(Account objacc:[select id,name from Account]){
            lst.add(objacc.Name);
    }
    for(Account a : Trigger.new){
        if(lst.contains(a.Name)){ 
            a.adderror('account name is duplicate');
        }
    }
}