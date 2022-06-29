/**
* Description   - Overriding
*
* Created by    - Kamlesh Kumar
*
* Created Date  - 28/06/2022
*
* Revision log  -  V_1.0 - Created  - Kamlesh Kumar
*               
*
**/
public virtual class MethodOverriding {
    /**
    * Description   - Parent Inner Class
    *
    * Created by    - Kamlesh Kumar
    *
    * Created Date  - 28/06/2022
    *
    * Revision log  -  V_1.0 - Created  - Kamlesh Kumar
    *               
    *
    **/
    public virtual class Parent{
        private Integer pvt;
        protected Integer ptd;
        public Integer pub;
        /**   Description :   Parent inner class
        *
        *     Created By  :   Kamlesh Kumar
        *
        *     Arguments   :   None
        *
        *     Return      :   none
        *
        *     Revision log:   V_1.0 - Created  - Kamlesh Kumar
        *                   
        * 
        **/
        public virtual void getvalues (){
            system.debug ('Pvt Mem' +pvt);
            system.debug('ptd Mem' +ptd);
            system.debug ('pub mem'+ pub);
        }
    }
    /**
    * Description   - Child inner class
    *
    * Created by    - Kamlesh Kumar
    *
    * Created Date  - 28/06/2022
    *
    * Revision log  -  V_1.0 - Created  - Kamlesh Kumar
    *               
    *
    **/
    public virtual class Child extends Parent {
        private Integer pvt;
        /**   Description :   Child inner class
        *
        *     Created By  :   Kamlesh Kumar
        *
        *     Arguments   :   None
        *
        *     Return      :   none
        *
        *     Revision log:   V_1.0 - Created  - Kamlesh Kumar
        *                     
        * 
        **/
        public override void getvalues() {
            system.debug ('Pvt ch Mem' + pvt);
        }
    }
    /**
    * Description   - Test inner class
    *
    * Created by    - Kamlesh Kumar
    *
    * Created Date  - 28/06/2022
    *
    * Revision log  -  V_1.0 - Created  - Kamlesh Kumar
    *                
    *
    **/
    public class Test {
        /**   Description :   Test inner class print the Overiding
        *
        *     Created By  :   Kamlesh Kumar
        *
        *     Arguments   :   None
        *
        *     Return      :   none
        *
        *     Revision log:   V_1.0 - Created  - Kamlesh Kumar
        *                   
        * 
        **/
        public void main() {
            Parent p1= new Parent ();
            p1.getvalues ();
            Child c1= new Child();    
            c1.getvalues ();
        }
    }
}