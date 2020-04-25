trigger Account on Account (before insert) {
ContactInsertHandler.InsertCon(trigger.new);
}