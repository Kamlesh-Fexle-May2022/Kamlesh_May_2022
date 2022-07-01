/**
* Description   - DiscountOnProduct
*
* Created By    - Kamlesh Kumar
*
* Created Date  - 29/06/2022
*
* Revision Logs  -  V_1.0 - Created  - Kamlesh Kumar
*
**/
public with sharing class DiscountOnProduct {
    public virtual interface PurchaseOrder {
        Double discount(Double Price);
    }
    // CustomerPurchaseOrder class
    public class CustomerPurchaseOrder implements PurchaseOrder {
        public Double discount(Double Price) {
            return 0.9 * Price;
        }
    }
    //  EmployeePurchaseOrder Class 
    public class EmployeePurchaseOrder implements PurchaseOrder {
        public Double discount(Double price) {
            return 0.8 * price;
        }
    }
    // SellerPurchaseOrder Class
    public class SellerPurchaseOrder implements PurchaseOrder {
        public Double discount(Double price) {
            return 0.7 * price;
        }
    }
    // ProcessPurchaseOrder Class
    public class ProcessPurchaseOrder {
        public ProcessPurchaseOrder(){
        PurchaseOrder order1 = new CustomerPurchaseOrder();
        PurchaseOrder order2 = new EmployeePurchaseOrder();
        PurchaseOrder order3 = new SellerPurchaseOrder();
        
        ProcessOrder(order1,'10 % discount');
        ProcessOrder(order2,'20 % discount');
        ProcessOrder(order3,'30 % discount');
    }
    // Method
    public void processOrder(PurchaseOrder order,String str){
        System.debug('Price :::'+order.discount(500)+str);
    }
    } 
}