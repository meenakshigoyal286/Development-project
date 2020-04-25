public class BooksClass {
    public static void OnafterUpdate(List<Boooks__c> lstofbooks , Map<Id,Boooks__c> oldMapOfBooks){
        if(trigger.isInsert){
            map<string,Books__c> newSubjectMap = new map<string,Books__c>();
            for(Books__c objCustomSetting :Books__c.getall().values()){
                system.debug('====Books Object===='+objCustomSetting);
                newSubjectMap.put(objCustomSetting.Name, objCustomSetting);
                System.debug('custom setting '+objCustomSetting);
            }
            System.debug(newSubjectMap);
            
            for(Boooks__c objBoooks : lstofbooks ){
                if(objBoooks.Subject__c!=null){
                    if(newSubjectMap.containskey(objBoooks.Subject__c)){
                        objBoooks.Discount__c = newSubjectMap.get(objBoooks.Subject__c).Discount__c;
                        System.debug('booksobject'+objBoooks.Discount__c);
                        System.debug(newSubjectMap.get(objBoooks.Subject__c));
                    }
                }
            }
        }
        if(trigger.isUpdate){
            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
            EmailTemplate emailTemplate = [select Id, Subject,Body from EmailTemplate where Id ='00X2v000001zhXE'];
            String subject = emailTemplate.Subject;
            String plainBody = emailTemplate.Body;
            for(Boooks__c objBoooks : lstofbooks ){
                Messaging.SingleEmailMessage sendMail = new Messaging.SingleEmailMessage();
                sendMail.setTemplateId(emailTemplate.Id);
                sendMail.setTargetObjectId(objBoooks.OwnerId);
                subject = subject.replace('{!Boooks__c.Subject__c}', objBoooks.Subject__c);
                plainBody = plainBody.replace('{!Boooks__c.Subject__c}', objBoooks.Subject__c);
                sendMail.setSaveAsActivity(false);
                sendMail.setSubject(subject);
                sendMail.setPlainTextBody(plainBody);
                mails.add(sendMail);
            }
            
            Messaging.sendEmail(mails);
            
        }
        
    }
}