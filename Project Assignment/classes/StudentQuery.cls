public class StudentQuery {
    public StudentQuery(){
        List<Student__c> StudentList=[select id, Name,Roll_Number__c,Mobile_Number__c,Father_Name__c,
                                      Father_Mobile_Number__c,Home_Phone_Number__c,Student_Email__c,
                                      Student_Address__c,Overall_Grade__c from Student__c order by createddate DESC limit 5];
        for(Student__c Student:StudentList)
           system.debug('Data of Student:::' + Student);
    }
}