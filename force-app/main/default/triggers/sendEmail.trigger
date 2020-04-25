trigger sendEmail on Opportunity (after insert, after update) {
    for(Opportunity opp:Trigger.new) {
        if(opp.StageName == 'Closed Won'){
             Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
             email.setToAddresses(new String[]{'meenakshi.goyal@360degreecloud.in'});
             email.setTemplateId('00X2v000001PPUO');
             email.setHtmlBody('This is a test email');
             Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        }
    }
}