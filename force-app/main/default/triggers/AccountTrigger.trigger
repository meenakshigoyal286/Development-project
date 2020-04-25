trigger AccountTrigger on Account (after insert,after update) {
AccountTriggerHandler.ChangeOwnerTrigger(trigger.new,trigger.oldmap);
    ContactUpdate.WebsiteProfile(trigger.old);
}