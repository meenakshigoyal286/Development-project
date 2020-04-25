trigger TriggerCase1 on Case (before insert) {
TriggerCase1Handler.caseStatus(Trigger.new);
}