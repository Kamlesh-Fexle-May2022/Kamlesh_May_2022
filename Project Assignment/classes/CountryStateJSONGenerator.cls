/**
*  Description     :  Country State JSON Generator 
*
*  Created By      :  Kamlesh Kumar
*
*  Created Date    :  07/14/2022
*
*  Revision Logs   :    V1.0 - Created - Kamlesh Kumar
**/
public with sharing class CountryStateJSONGenerator {
    public List<String> countryList{get; set;}

    public class States{
        public string stateName{get; set;}
        public List<Districts> districts{get; set;}
    }

    public class Districts{
        public string districtName{get; set;}
    }

    public class Country{
        public String countryName{get; set;}
        public Integer countryCode{get; set;}
        public Integer totalStatesNumber{get; set;}
        public Integer totalDistricts{get; set;}
        public List<States> states{get; set;}
    }
}