/**
* Description   - Data Types And Methods
*
* Created by    - Kamlesh Kumar
*
* Created Date  - 26/06/2022
*
* Revision log  -  V_1.0 - Created  - Kamlesh Kumar
*
**/
public with sharing class DatatypeAndMethods {
     /**
     * 
     *   @description    :  All Data Types And Methods
     *  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Kamlesh Kumar
     *  
     **/
    
    // <---------------Date Method---------------->
    
    public static void dateMethod(){
        Date myDate = Date.newInstance(2022,6,23);
        System.debug('Today Date : ' + myDate);
    }
    public static void addYears(){
        Date myDate = Date.newInstance(2022,6,23);
        Date newDate = myDate.addYears(2);
        system.debug('New Date : '+ newDate);
    }
    public static void day(){
        date myDate = date.newInstance(1989, 4, 21);
        Integer day = myDate.day();
        system.debug(day);
    }
    public static void numberDays(){
        Integer numberDays = date.daysInMonth(1960, 2);
        system.debug(numberDays);
    }
     public static void addMonths(){
        date myDate = date.newInstance(1990, 11, 21);
        date newDate = myDate.addMonths(3);
        system.debug(newDate);
    }
    public static void today(){
        Date myDate = Date.today();
        system.debug(myDate);
    }
    //<--------------Date Time Method------------------>
    public static void dateTimeMethod_1(){
        DateTime myDateTime = DateTime.now();
        system.debug(myDateTime);
    }
    public static void addHours(){
        DateTime myDateTime = DateTime.newInstance(1997, 1, 31, 10, 8, 16);
        DateTime newDateTime = myDateTime.addHours(1);
        system.debug(newDateTime);
    }
    public static void dateTimeMethod_2(){
        DateTime myDateTime = DateTime.newInstance(1993,6,6,3,3,3);
        system.debug(myDateTime);
    }
    //<----------------Long----------->
    public static void longDataType(){
    Long l = 2147483648L;
    system.debug(l);
    }
    //<-------------Boolean---------------->
    public static void bolleanExample(){
        Boolean isWinner = True;
        system.debug(isWinner);
    }
   
    // <------------Double----------------->
    public static void doubleExample(){
        Double d = 4.5689;
        system.debug(d);
    }
   
    // <-------------ID--------------------->
    public static void idExample(){
        Id i = '00307003T2PGAA0';
        system.debug(i);
    }
   
    // <------------Integer------------------>
    public static void integerExample(){
        Integer i = 10;
        system.debug(i);
    }
   
    // <------------Object--------------------->
    public static void objectExample(){
        Object obj = 10;
        Integer i = (Integer)obj;
        system.debug(obj);
    }

    // <-----------String---------------->
        public static void stringExample(){
        String str1 = 'I Am Learning Apex.';
        system.debug(str1);
    }

   // <----------String Method-------------------------->
    public static void stringMethod(){
        String str1 = 'I Am Learning Apex.';
        String str2 = str1.capitalize();
        system.debug(str2);
    }

    public static void isAllLowerCase(){
        String str1 = 'apex';
        system.debug(str1.isAllLowerCase());
    }

    public static void compareToStrings(){
        String myString1 = 'abcde';
        String myString2 = 'cd';
        Integer result = myString1.compareTo(myString2);
        System.debug(result);
    }

    public static void capitalize(){
        String s = 'hello maximillian';
        String s2 = s.capitalize();
        System.debug(s2);
    }

    public static void equals(){
        String myString1 = 'abcde';
        String myString2 = 'abcd';
        Boolean result = myString1.equals(myString2);
        System.debug(result);
    }
   
   //<--------------- Map method---------------->
    public static void mapMethod(){
        Map<String,String> myString = new Map<String,String>{'A'=> 'B', 'C' => 'D'.toLowerCase()};
        system.debug(myString);
    }

    public static void mapMethod_1(){
        Map<String,String> country_Currencies = new Map<String,String>();
        map<ID, Set<String>> m = new Map<Id, set<String>>();
        system.debug(m);
    }

    public static void put(){
        Map<Integer,String> rollNumber_Name = new Map<Integer,String>();
        rollNumber_Name.put(11,'Kamlesh Kumar');
        rollNumber_Name.put(22,'Manish Kumar');
        system.debug(rollNumber_Name);
    }

    public static void get(){
        Map<String, String> colorCodes = new Map<String, String>();
        colorCodes.put('Red', 'FF0000');
        colorCodes.put('Blue', '0000A0');
        String code = colorCodes.get('Blue');
        system.debug(code);
    }

    public static void keySet(){
        Map<String, String> colorCodes = new Map<String, String>();
        colorCodes.put('Red', 'FF0000');
        colorCodes.put('Blue', '0000A0');
        Set <String> colorSet = new Set<String>();
        colorSet = colorCodes.keySet();
        system.debug(colorSet);
    }
   
    //<----------List Method---------------->
    public static void add(){
        List<String> myList = new List<String>();
        myList.add('Kamlesh Kumar');
        myList.add('Manish Kumar');
        system.debug(myList);
    }

    public static void listMethod_2(){
        List<String> myList = new List<String>{'Jaipur','Sikar','Jabalpur','Tonk'};
        system.debug(myList);
    }

    public static void sort(){
        List<String> colors = new List<String>{
            'Yellow',
            'Red',
            'Green'};
        colors.sort();
        System.debug(colors);
    }
   
    // <------------Set Method--------------->
    public static void addElements(){
        Set<Integer> mySet = new Set<Integer>();
        mySet.add(45);
        mySet.add(56);
        mySet.add(89);
        mySet.add(45);
        system.debug(mySet);      
    }

    public static void size(){
        Set<Integer> mySet = new Set<Integer>{1, 2, 3};
        Integer result = mySet.size();
        System.debug(result);
    } 
    public static void removeAll(){
        Set<integer> mySet = new Set<integer>{1, 2, 3};
        List<integer> myList = new List<integer>{1, 3};
        Boolean result = mySet.removeAll(myList);
        System.debug( result);
        Integer result2 = mySet.size();
        System.debug( result2);
    }
}