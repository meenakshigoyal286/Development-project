global class emailBatch implements Database.Batchable < sObject >, Schedulable, Database.Stateful {
	global List<String> errorMessages = new List<String>();
    global Database.QueryLocator start(Database.BatchableContext bc) {
        /* Date d = Date.today();*/
        Date ed = Date.today().addDays(110);
        System.debug(Date.today().addDays(110));
        
        set<Id> setContractIds = new set<Id>();

        for(Contract objContract: [SELECT  id,name FROM Contract WHERE EndDate =: ed]) {
			setContractIds.add(objContract.Id);
        }
        
        return Database.getQueryLocator('Select  id, Contract_Name__c , Contract_Email__c, EndDate, Owner.Email FROM Contract  WHERE Id IN: setContractIds');
    }

    global void execute(Database.BatchableContext bc, List < Contract > recs) {
        List < Messaging.SingleEmailMessage > mailList = new List < Messaging.SingleEmailMessage > ();
        for (Contract c: recs) {
            if (c.Contract_Email__c != null) {
                List < String > toAddresses = new List < String > ();
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                toAddresses.add(c.Contract_Email__c);
				toAddresses.add(c.Owner.Email);
                mail.setToAddresses(toAddresses);
                mail.setSubject('Notification Before 110 Days of Contract End Date');
                String messageBody = '<html><body>Hi ' + c.Name  + ',<br>Your  Contract Expires within 110 Days . <br>Kindly take approriate action.<br><br><b>Regards,</b><br>EDB</body></html>';
                mail.setHtmlBody(messageBody);
                mailList.add(mail);
            }
        }
        Messaging.sendEmail(mailList);
    }

    global void finish(Database.BatchableContext bc) {
		AsyncApexJob aaj = [Select Id, Status, NumberOfErrors, JobItemsProcessed, MethodName, TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
        
        // Send an email to the Apex job's submitter notifying of job completion.
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {aaj.CreatedBy.Email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('JOB Salesforce NotificationEmailtoAccountExecutive Finished: ' + aaj.Status);
        String bodyText='Total Job Items ' + aaj.TotalJobItems + ' Number of records processed ' + aaj.JobItemsProcessed + ' with '+ aaj.NumberOfErrors + ' failures.\n';
        bodyText += 'Number of Error Messages ' + errorMessages.size() + '\n';
        bodyText += 'Error Message' + String.join(errorMessages, '\n');
        mail.setPlainTextBody(bodyText);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	}
	
	global void execute(SchedulableContext SC) {
        emailBatch batchable = new emailBatch();
		database.executebatch(batchable);
    }
}