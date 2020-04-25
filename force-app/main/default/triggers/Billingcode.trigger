trigger Billingcode on Account (before insert,before update) {
    List<Account> lstacc= new List<Account>(); 
    for(Account objacc: trigger.new){
        if (objacc.Country__c=='US'  ){
          objacc.Billing_code__c='99999';
        }
        else if(objacc.Country__c=='USA'){
            objacc.Billing_code__c='99999-9999';
        }else{
            objacc.Billing_code__c='';
        }
    }
}