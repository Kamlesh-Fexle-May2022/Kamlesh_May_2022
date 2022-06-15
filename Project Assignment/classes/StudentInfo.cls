public class StudentInfo {
    public StudentInfo(){
        
        // Student Information
        Student__c Student= new Student__c();
        Student.Name='Sahil kumar';
        Student.Roll_Number__c=213;
        Student.Mobile_Number__c='9950243371';
        Student.Father_Name__c='Phool Chand';
        Student.Father_Mobile_Number__c='9782613321';
        Student.Home_Phone_Number__c='9663752381';
        Student.Student_Email__c='Kamlesh@gmail.com';
        Student.Student_Address__c='jaipur';
        Student.Overall_Grade__c='A';
         
        //Class information
        Student.Stream__c='Computer Science Engineering';
        Student.Class__c='12th Class';
        Student.Section__c='Section B';
         
         //Fees Information
        Student.Current_Year__c=date.parse('02/06/2022');
        Student.Exam_Fees_Submitted__c=true;
        Student.Fees_Submitted__c=true;
        Student.Pending_Exam_Fees__c=1000;
        Student.Pending_Fees_Amount__c=500;
        Student.Is_Donation__c=true;
        Student.Donation_Amount__c=2000;
        Student.Pending_Overall_Amount__c=4000;
        
        
        //Bank Details
        Student.Bank_Name__c='SBI Jaipur';
        Student.Account_Number__c=372849357;
        Student.Bank_Phone_Number__c='9453778332';
        Student.IFSC_Code__c='SBI2742179';
        Student.Mobile_No__c='982854344';
        Student.State__c='Rajasthan';
        Student.City__c='Jaipur';
        insert Student;
        system.debug('insert record id :::'+Student.id);
    }
}