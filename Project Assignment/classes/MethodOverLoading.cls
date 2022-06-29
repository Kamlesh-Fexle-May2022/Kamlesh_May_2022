/**
* Description   - Overloading
*
* Created by    - Kamlesh Kumar
*
* Created Date  - 26/06/2022
*
* Revision log  -  V_1.0 - Created  - Kamlesh Kumar
*             
*
**/
public with sharing class MethodOverLoading {
    /**   Description :   Overloading  
    *
    *     Created By  :   Kamlesh Kumar
    *
    *     Arguments   :   Two Integer
    *
    *     Return      :   Integer
    *
    *     Revision log:   V_1.0 - Created  - Kamlesh Kumar
    *                  
    * 
    **/
    public static Integer sum(Integer a,Integer b){
        Integer s = a+b;        
        system.debug(s);
        return s;
    }
    /**   Description :   Overloading  
    *
    *     Created By  :   Kamlesh Kumar
    *
    *     Arguments   :   Three Integer
    *
    *     Return      :   Integer
    *
    *     Revision log:   V_1.0 - Created  -Kamlesh Kumar
    *                
    * 
    **/
    public static Integer sum(Integer a,Integer b,Integer c)
    {
        Integer s = a+b+c;        
        system.debug(s);
        return s;
    }
}