trigger AccountUser on Account (before insert) {
  AccountUserHandler.GetAnotherUser(trigger.new);
}