/**
* Description   - Expression Operators and Type Casting
*
* Created by    - Kamlesh Kumar
*
* Created Date  - 26/06/2022
*
* Revision log  -  V_1.0 - Created  - Kamlesh Kumar
*
**/
public with sharing class ExpressionsAndOperators {
    public ExpressionsAndOperators(Integer a,Integer b,Integer c,Boolean d,Boolean e) {
    /**   Description :   Expression Constructor  Using to calculate all Operators
    *
    *     Created By  :   Kamlesh Kumar
    *
    *     Arguments   :   Integer,boolean
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Kamlesh Kumar
    * 
    **/
    //*********Arithmetic  Expression**************
    System.debug(a+b);  
    System.debug(a-b); 
    System.debug(a*b); 
    System.debug(a/b);  
        
    //*********Relation Expression***********
    System.debug(a>b);      //Greater than operator 
    System.debug(a<b);      //Less than operator 
    System.debug(a>=b);     //Greater than or equal to operator
    System.debug(a<=b);     //Less than or equal to operator
    System.debug(a!=b);     //Inequality operator
    System.debug(a==b);     //Equality operator
    System.debug(++a);       //Increment operator
    System.debug(a++);
    System.debug(--a);      //Decrement operator
    System.debug(a--);

    //*******************Assignment Expression ********
    System.debug(a+=b);     //Addition assignment operator 
    System.debug(a-=b);     //Subtraction assignment operator
    System.debug(a*=b);     //Multiplication assignment operator
    System.debug(a/=b);     //Division assignment operator

    //****************Unary Expression******************* 
    System.debug(~a);           //(minus of total positive value which starts from 0)  
    System.debug(~b);           // (positive of total minus, positive starts from 0)  
    System.debug(!d);           // (opposite of boolean value)  
    System.debug(!e);           //(opposite of boolean value)

    //**********Left Shift Expression ****************** 
    System.debug(a<<b);   // for ex - 10*2^2=10*4=40   

    //**********************Right Shift Expression******************** 
    System.debug(a>>b);   //for ex - 10/2^2=10/4=2  
  
    // ****************AND Expression ******************* 
    System.debug(a<b&&a<c);
    System.debug(a<b&a<c);
  
    //******************* OR Expressiono ******************
    System.debug(a>b||a++<c);
    System.debug(a>b|a++<c);
  
    //*****************Ternary Expression*******************
    Integer min=(a<b)?a:b;  
    System.debug(min); 

    //***************Role of Conversion**************
    Double mywide1 = a; // Widening(Automatic) casting: integer to double
    Decimal mywide2 = b;
    System.debug(mywide1);
    System.debug(mywide2); 
    Double mynarrow1 = 9.78d;
    Integer mynarrow2 = (Integer) mynarrow1; // Narrowing(Manual) casting: double to integer
    Long mynarrow3 = (Long) mynarrow1;
    System.debug(mynarrow2);
    System.debug(mynarrow3);
    Decimal mywide3 = mynarrow2;
    System.debug(mywide3);
    }

    //********Safe Operator***********
    public Static void safeOperator(){
    String a = Null;
    String b = 'abc';
    System.debug(a==null? b: a);
    Account acc = new Account();
    acc.Name = 'test';
    insert acc;
    System.debug([Select Id, Name From Account Where Id=:acc.Id]?.Name);
    }
}