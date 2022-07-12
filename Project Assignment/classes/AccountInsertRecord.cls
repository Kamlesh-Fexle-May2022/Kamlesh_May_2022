/**
*  Description     :  Insert Record IN Account
*
*  Created By      :  Kamlesh Kumar
*
*  Created Date    :  07/04/2022
*
*  Revision Logs   :    V1.0 - Created - Kamlesh Kumar
**/
public with sharing class AccountInsertRecord {
    /**
    *   @description    :  Insert Record IN Account
    *
    *   @return         :   void
    *
    *   @revision Log   :   V1.1 - Created  - 07/04/2022 - Developer Name - Kamlesh Kumar
    **/
    public static void accountInsertRecord() {
        List<Account> accList = new List<Account>();
        for(Integer i=1;i<20;i++)
        {
           Account a = new Account(Name = 'Test Account '+i);
           accList.add(a);
        }
     	insert accList;
     	List<Account> lst = AccountInsertRecord.accountUpdateRecord(accList);
     	for(Account acc2 : lst){
        	System.debug(acc2.Name);
     	}
     	AccountInsertRecord.accountUpsertRecord(accList);
    }
    
    public static List<Account> accountUpdateRecord(List<Account> accList) {
    	if(!accList.isEmpty()){
        	List<Account> accList1 = [Select Name from Account where CreatedDate = TODAY];
        	for(Account a : accList)
        	{
          		a.Name = a.Name + ' Update';
        	}
     		update accList;
     		return accList;
     	}
    	return accList;
    } 
    public static void accountUpsertRecord(List<Account> accList) {
        if(!accList.isEmpty()){
        	Integer i=1;
      		for(Account acc1 : accList)
        	{
         acc1.Name = 'NewRecords in Upsert ' + i;
         acc1.NumberOfEmployees = 1001;
         i++;
        }
     	upsert accList;
        for(Account acc2 : accList){
            System.debug(acc2.Name + ' ' + acc2.NumberOfEmployees);
        }
      }
    }
}