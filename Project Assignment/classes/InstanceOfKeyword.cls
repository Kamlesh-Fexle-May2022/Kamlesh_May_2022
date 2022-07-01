/**
* Description   - Instance Of Keyword
*
* Created By    - Kamlesh Kumar
*
* Created Date  - 29/06/2022
*
* Revision Logs  -  V_1.0 - Created  - Kamlesh Kumar
*
**/
public with sharing class InstanceOfKeyword {
    // Constructor
    Public InstanceOfKeyword() {
        sObject s = new Contact();
        //Account a = (Account)s;
        Contact c =(Contact)s;
        if(s instanceOf Account){
            Account account_1 = (Account)s;
            System.debug(account_1 +'This is for Account');
        }
        else if(s instanceOf Contact){
            Contact contact_1 = (Contact)s;
            System.debug(contact_1 + ' This is for Contact');
        }
    }
}