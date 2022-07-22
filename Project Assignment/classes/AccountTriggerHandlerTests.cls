/**
*  Description     :  AccountTriggerHandlerTests
*
*  Created By      :  Kamlesh Kumar
*
*  Created Date    :  07/21/2022
*
*  Revision Logs   :    V1.0 - Created - Kamlesh Kumar
**/
@isTest(SeeAllData = false)
private with sharing class AccountTriggerHandlerTests {
	@TestSetup
    static void makeData(){
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name='Test1', Type='Saving'));
        insert accounts;
    }
    //This method test the updateaccountnumberasperaccounttype Accounttriggerhandler class
    @isTest
    private static void testupdateAccountNumberASPerAccountType(){
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name = 'Test2', Type='Saving'));
        accounts.add(new Account(Name = 'Test3', Type='FD'));
        System.Test.startTest();
        	insert accounts;
        System.Test.stopTest();
        List<Account> acc = [Select Id, AccountNumber From Account Where ID IN:accounts Order By Name];
        System.assert(acc[0].AccountNumber.startsWith('SB'), 'Account Number Should Starts With SB');
        System.assert(acc[1].AccountNumber.startsWith('FD'), 'Account Number Should Starts With FD');
    }
    // This method test the sendEmail method of Account Trigger Handler Class 
    @isTest
    private static void testSendEmail(){
        System.Test.startTest();
        	AccountTriggerHandler.sendEmail([Select Id, Name, Type, AccountNumber From Account]);
        System.Test.stopTest();
       System.assertEquals(1, Limits.getEmailInvocations(), 'Emails should be sent');
    }
}