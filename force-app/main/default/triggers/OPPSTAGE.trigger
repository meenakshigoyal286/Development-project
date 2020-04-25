trigger OPPSTAGE on Opportunity (before insert) {
Triggeropp1Handler.oppStage(Trigger.new);
}