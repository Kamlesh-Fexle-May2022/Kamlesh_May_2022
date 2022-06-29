/**
* Description   - Constructors
*
* Created by    - Kamlesh Kumar
*
* Created Date  - 28/06/2022
*
* Revision log  -  V_1.0 - Created  - Kamlesh Kumar
*
**/
public with sharing class Constructors {
    /**   Description :   Constructor Non Parameterized
    *
    *     Created By  :   Kamlesh Kumar
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Kamlesh Kumar
    * 
    **/
    public Constructors() {
        String EmployeeName = 'Kamlesh Kumar';
        Integer EmployeeNo = 175;
        System.debug('Emplyeename is ' +EmployeeName);
        System.debug('EmplyeeNo is ' +EmployeeNo);
    }
    /**   Description :   Constructor Parameterized
    *
    *     Created By  :   Kamlesh Kumar
    *
    *     Arguments   :   String, Integer
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Kamlesh Kumar
    * 
    **/
    public Constructors(String EmployeeName, Integer EmployeeNo) { 
        System.debug('Emplyeename is ' +EmployeeName);
        System.debug('EmplyeeNo is ' +EmployeeNo);
    }

}