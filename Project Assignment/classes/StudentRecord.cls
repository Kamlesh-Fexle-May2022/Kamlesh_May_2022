/**
*  Description     :  Retrieve The Student Records
*
*  Created By      :  Kamlesh Kumar
*
*  Created Date    :  06/24/2022
*
*  Revision Logs   :    V1.0 - Created - Kamlesh Kumar 
*
**/
public with sharing class StudentRecord {
        
     /**
     * 
     *   @description    :  Retrieve The Student Records For YogaClass
     *  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Kamlesh Kumar
     *  
     **/
        public static void yogaClass() {
            
            //Student_c student = new Student_c();
            // Hierarchical Collection example using Map and List
            Map<String, Map<String, List<Student__c>>> yogaClassMap = new Map<String, Map<String, List<Student__c>>>();
    
            // 11th Class List of Student
            List<Student__c> firststYearListComputer = new List<Student__c>();
            firststYearListComputer = [SELECT ID, Name, Roll_Number__c, Class__c, Stream__c 
            from Student__c 
            where Class__c = '12th Class' and Stream__c = 'Computer Science Engineering'];
            Map<String, List<Student__c>> mapOfStudentwithStream11thClass = new Map<String, List<Student__c>>();
            mapOfStudentwithStream11thClass.put('Computer Science Engineering', firststYearListComputer);
    
            // 11th Class List of Student
            List<Student__c> firststYearListComputer_1 = new List<Student__c>();
            firststYearListComputer_1 = [SELECT ID , Name, Roll_Number__c, Class__c, Stream__c 
            from Student__c 
            where Class__c = '12th Class' and Stream__c = 'Computer Science Engineering'];
            mapOfStudentwithStream11thClass.put('Computer Science Engineering',firststYearListComputer_1);
    
            // 12th Class List of Student
            List<Student__c> secondYearListElectronic = new List<Student__c>();
            secondYearListElectronic = [SELECT ID, Name, Roll_Number__c, Class__c, Stream__c 
            from Student__c 
            where Class__c = '12th Class' and Stream__c = 'Computer Science Engineering'];
            Map<String, List<Student__c>> mapOfStudentwithStream12thClass = new Map<String, List<Student__c>>();
            mapOfStudentwithStream12thClass.put('Computer Science Engineering', secondYearListElectronic);
    
            yogaClassMap.put('11th Class', mapOfStudentwithStream11thClass);
            yogaClassMap.put('12th Class', mapOfStudentwithStream12thClass);
            System.debug(yogaClassMap);
        }
}