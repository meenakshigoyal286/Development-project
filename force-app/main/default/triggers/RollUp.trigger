trigger RollUp on Opportunity (after insert) {
    if(trigger.isInsert){
        list<Account> lstofAcc = new List<Account>();
            for(Opportunity objopp: trigger.new){
                if(objopp.AccountId!=null){
					Account acc = new Account();
                    acc.Id = objopp.AccountId;
                    if(acc.NumberOfEmployees!=null){
                    acc.NumberOfEmployees+=1;
                    }
                    lstofAcc.add(acc);
                }
        	update lstofAcc;
    }
}
}