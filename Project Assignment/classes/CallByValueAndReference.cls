/**
* Description   - Call By Value And Call By Reference
*
* Created by    - Kamlesh Kumar
*
* Created Date  - 28/06/2022
*
* Revision log  -  V_1.0 - Created  - Kamlesh Kumar
*
**/
public with sharing class CallByValueAndReference {
    /**   Description :   Call By Value And Call By Reference
    *
    *     Created By  :   Kamlesh Kumar
    *
    *     Arguments   :   Value,Reference
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Kamlesh Kumar
    * 
    **/
    public CallByValueAndReference() {
        Account a = new Account();
        a.Name = 'salessoft';
        a.Website = 'www.Kamleshsales.com';
        changeWebsite(a);
        System.debug('Website - '+a.Website);
    }

    public Account changeWebsite(Account b) {
        //Create New Object and try to replace old
        b = new Account();
        b.Website = 'www.salesforce.com';
        System.debug('Website = '+b.Website);
        return b;
    }
}