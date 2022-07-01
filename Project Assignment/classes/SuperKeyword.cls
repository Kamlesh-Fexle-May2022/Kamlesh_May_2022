/**
* Description   - Use Super Keyword Foe Calling Parent Class Properties
*
* Created By    - Kamlesh Kumar
*
* Created Date  - 29/06/2022
*
* Revision Logs  -  V_1.0 - Created  - Kamlesh Kumar
*
**/
public with sharing class SuperKeyword {
    // Parent Class 
    public virtual class Animal{
    
        public virtual void eat(){
        System.debug('eating...');
        }  
    }  
    // Child Class Inheriting Parent Class
    public virtual class Dog extends Animal {

        public override virtual void eat(){
        Super.eat();  
        System.debug('eating bread...'); 
       }
    }
}