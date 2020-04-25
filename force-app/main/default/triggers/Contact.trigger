trigger Contact on Contact (after insert , after update) {
ContactsDeadHandler.CreateContact(trigger.new);
}