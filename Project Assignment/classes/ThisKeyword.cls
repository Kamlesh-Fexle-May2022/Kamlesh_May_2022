/**
* Description   - This Keyword
*
* Created By    - Kamlesh Kumar
*
* Created Date  - 29/06/2022
*
* Revision Logs  -  V_1.0 - Created  - Kamlesh Kumar
*
**/
public with sharing class ThisKeyword {
    // callByThisKeyword Method 
    public void callByThisKeyword () {
        System.debug('Hello M'); 
    } 
    // performThisKeyword Method 
    public void performThisKeyword () {  
        System.debug('Hello N');  
        this.callByThisKeyword();  
   }  
}