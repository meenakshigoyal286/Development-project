trigger sendemailoncase on Case (after insert) {
    if(trigger.isInsert){
        for(Case objcase: trigger.new){
          Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
          mail.setToAddresses(new String[]{'meenakshi.goyal@360degreecloud.in'});
          mail.setReplyTo('youremail@yourdomain.com');
          mail.setSenderDisplayName('Your Name');
          mail.setSubject('Case details');
          string body = 'Dear ' + '{!Case.Id}' + '{!Case.CaseNumber}';
          body += 'Email Body.';
          mail.setHtmlBody(body);
          Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
  	} 
}