/**
*  Description     :  Soql And DML Statements
*
*  Created By      :  Kamlesh Kumar
*
*  Created Date    :  07/11/2022
*
*  Revision Logs   :    V1.0 - Created - Kamlesh Kumar
**/
public with sharing class SoqlAndDmlStatement {
    /**
    *   @description    :  Insert Record IN Account And Dml Statements
    *
    *   @return         :   void
    *
    *   @revision Log   :   V1.1 - Created  - 07/11/2022 - Developer Name - Kamlesh Kumar
    **/
    public static void accountInsertRecord() {
        List<Account> accList = new List<Account>();
            for(Integer i=1;i<5;i++)
            {
                Account a = new Account(Name = 'Account '+i);
                accList.add(a);
            }
            insert accList;
            List<Account> lst = SoqlAndDmlStatement.accountUpdateRecord(accList);
            for(Account acc2 : lst){
                System.debug(acc2.Name);
            }
        accountUpsertRecord(accList);
        deletedRecord();
        mergeRecord();
    }

    public static List<Account> accountUpdateRecord(List<Account> accList) {
        if(!accList.isEmpty()){
            List<Account> accList1 = [Select Name from Account Where CreatedDate = TODAY];
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

    public static void deletedRecord(){
        List<Account> delAcc = [SELECT Name FROM Account WHERE Name = 'NewRecords in Upsert 3'];
        if(!delAcc.isEmpty())
            delete delAcc;
        System.debug('Deleted Record '+delAcc);
    }

    public static void mergeRecord(){
        List<Account> ls = new List<Account>{
            new Account(name='Account'),
            new Account(name='AccountMerge')
        }; 
        if(!ls.isEmpty())
            insert ls;

        // Queries to get the inserted accounts 
        Account masterAcct = [SELECT Id, Name FROM Account WHERE Name = 'Account ' LIMIT 1];
        Account mergeAcct = [SELECT Id, Name FROM Account WHERE Name = 'AccountMerge' LIMIT 1];

        // Add a contact to the account to be merged
        Contact c = new Contact(FirstName='Joe',LastName='Merged');
        c.AccountId = mergeAcct.Id;
        insert c;

        try {
            merge masterAcct mergeAcct;
        } catch (DmlException e) {
            // Process exception
            System.debug('An unexpected error has occurred: ' + e.getMessage()); 
        }
        System.debug('Merge Operation Inserted');
    }
}