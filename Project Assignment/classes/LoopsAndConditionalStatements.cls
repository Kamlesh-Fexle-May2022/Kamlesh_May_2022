/**
* Description   - Loops And Conditional Statements
*
* Created by    - Kamlesh Kumar
*
* Created Date  - 28/06/2022
*
* Revision log  -  V_1.0 - Created  - Kamlesh Kumar
*
**/
public with sharing class LoopsAndConditionalStatements {
    /**   Description :  Loops And Conditional Statements 
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
    //**************** If Else ********************
    public static void ifElseCondition(){
        Integer a=2,b=4;
        System.debug(a==b);
    if(a==b){
        System.debug('Yes');
        }
    else{
        System.debug('No');
        }
    }

    //*************If If Else Conditional Statement****
    public static void ifIfElseCondition(){
        Integer a=4,b=2;
    if(a==b){
        System.debug('Yes');
        }
    if(a>b){
        System.debug('Greater');
        }
    else{
        System.debug('No');
        }
    }

    //************ If Else Ladder**************
    public Static void  ifElseLadderCondition(){
        Integer a=4;
        if(a==1){
         System.debug('a==1');
        }
            else if(a==2){
            System.debug('a==2');
            }
            else if(a==3){
            System.debug('a==3');
            }
            else if(a==4){
            System.debug('a==4');
            }
        else{
        System.debug('No');
        }
    }

    //********************Do While Loop*************
    public static void doWhileLoop(){
        Integer count = 1;
        do {
            System.debug(count);
            count++;
        }while (count <= 10);
    }

    //************************ While Loop*****************
    public static void whileLoop(){
        Integer count = 1;
        while (count <= 10) {
        System.debug(count);
        count++;
        }
    }

    //************ For Loop*************
    public static void forLoop(){
        for (Integer a=1; a<=10; a++) {
            System.debug(+a*2);
        }
    }

    //************ For Each Loop***********
    public static void forEachLoop(){
        List<Account> accList = [SELECT Id,Name From Account LIMIT 20];
        for(Account acc : accList){
        system.debug('##'+acc);
        }
    }
}