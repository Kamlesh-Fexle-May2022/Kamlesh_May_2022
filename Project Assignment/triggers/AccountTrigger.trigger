/**
*  Description     :  AccountTrigger on the Account Object
*
*  Created By      :  Kamlesh Kumar
*
*  Created Date    :  07/21/2022
*
*  Revision Logs   :    V1.0 - Created - Kamlesh Kumar
**/
trigger AccountTrigger on Account (before insert, after insert) {
    if(trigger.isBefore){
        System.debug('Before Trigger Operation.............');
        if(trigger.isInsert){
            AccountTriggerHandler.updateAccountNumberASPerAccountType(Trigger.new);
        }
    }
    if(trigger.isAfter){
        System.debug('After Trigger Operation............');
        AccountTriggerHandler.sendEmail(Trigger.new);
    }
}