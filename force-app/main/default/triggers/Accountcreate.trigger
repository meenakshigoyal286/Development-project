trigger Accountcreate on Account (after insert) {
    Accountcreatehandler.accountInsert(trigger.new);
}