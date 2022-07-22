/**
*  Description     :  Dynamic Map Fill And Search Starting With Any Particular Key Name
*
*  Created By      :  Kamlesh Kumar
*
*  Created Date    :  07/14/2022
*
*  Revision Logs   :    V1.0 - Created - Kamlesh Kumar
**/
public with sharing class DynamicMapFillAndSearch {
    public static Map<String, Map<String, List<String>>> mapOfCountriesAndStatesWithDistricts = new Map<String, Map<String, List<String>>>();
    
     public  DynamicMapFillAndSearch(String searchword){
         mapOfCountriesAndStatesWithDistricts=singleQuaryMapFill();
         mapCountryStateAndDistrictSearch(searchword);
         countryJSONGenerator('India');
         
     }
     // Map fill throught using  multiple Queries
     public static Map<String, Map<String, List<String>>> mapProcessing(){
         List<Country__c> ListOfCountries = [Select Name 
         From country__c];
 
         List<State__c> ListOfStates = [Select Name,Country__r.Name 
         From State__c];
 
         List<District__c> ListOfDistricts = [Select Name,State__r.Country__r.Name,
         State__r.Name
         From District__c];
 
         Map<String,List<String>> mapOfCountryWithStates = new Map<String,List<String>>();
         for(Country__c countries : ListOfCountries) {
             List<String> statesList = new List<String>();
             for(State__c states : ListOfStates) {
                 
                 if (states.Country__r.Name==countries.Name){
                     statesList.add(states.Name);
                     if(mapOfCountryWithStates.containsKey(countries.Name)) {
                         mapOfCountryWithStates.values().add(statesList);
                     }
                     else {
                         mapOfCountryWithStates.put(countries.Name,statesList);
                     }
                 }
             }
         }
         System.debug('Presenting states with their countries' +mapOfCountryWithStates);
 
         Map<String,List<String>> mapOfStatesWithDistricts = new Map<String,List<String>>();
         for(State__c states : ListOfStates) {
            List<String> ListOfDistrict = new List<String>();
             for(District__c districts : ListOfDistricts){
                 
                 if (Districts.State__r.Name==states.Name){
                     ListOfDistrict.add(districts.Name);
                     if(mapOfStatesWithDistricts.containsKey(States.Name)){
                        mapOfStatesWithDistricts.values().add(ListOfDistrict);
                     }
                     else {
                        mapOfStatesWithDistricts.put(states.Name,ListOfDistrict);
                     }
                 }
             }
         }
     System.debug('Presenting districts of states with their countries' +mapOfStatesWithDistricts);
 
     Map<String, Map<String, List<String>>> mapOfCountriesAndStatesWithDistricts = new Map<String, Map<String, List<String>>>();
     for(String country : mapOfCountryWithStates.keySet()) {
         if(!mapOfCountriesAndStatesWithDistricts.containsKey(country)) 
             mapOfCountriesAndStatesWithDistricts.put(country, new Map<String, List<String>>());
                                                     
             if(mapOfCountriesAndStatesWithDistricts.containsKey(country)) {
                 for(String state : mapOfCountryWithStates.get(country)) {
                     mapOfCountriesAndStatesWithDistricts.get(country).put(state, new List<String>());
                     for(String district :mapOfStatesWithDistricts.get(state)){
                         List<String> districtList =new List<String>();
                         if(mapOfCountriesAndStatesWithDistricts.get(country).containsKey(state)){
                             districtList.add(district);
                             mapOfCountriesAndStatesWithDistricts.get(country).get(state).addAll(districtList);
                         }   
                     }                                                  
                 }
             }
         }
         return mapOfCountriesAndStatesWithDistricts;
     }
     // Search Country States Districts With Particular Key
     public void mapCountryStateAndDistrictSearch(String searchword) {
         if(!mapOfCountriesAndStatesWithDistricts.isEmpty()){
             for(String country : mapOfCountriesAndStatesWithDistricts.keySet()){
                 if(country.startsWith(searchword)){
                     for(String state : mapOfCountriesAndStatesWithDistricts.get(country).keySet()){
                         if(state.startsWith(searchword)){
                             for(String district : mapOfCountriesAndStatesWithDistricts.get(country).get(state)){
                                 if(district.startsWith(searchword)){
                                    System.debug(country+'->'+state+'->'+district);
                                 }
                             }
                         }
                     }
                 }
             }
         }
     }
     // country Name Total Numbers Of Disrtict And States JSON Generetor
     public static void countryJSONGenerator(String countryName) {
 
         List<Country__c> countries = [SELECT Name, Total_Number_of_Districts__c, Total_Number_of_States__c,            Country_Code__c, Country_JSON_Data__c 
         FROM Country__c
         WHERE Name =:countryName ];
 
         if(!countries.isEmpty()) {
             List<CountryStateJSONGenerator.States> states = new List<CountryStateJSONGenerator.States>();
             if(!mapOfCountriesAndStatesWithDistricts.get(countryName).keySet().isEmpty()){
                 for(String state: mapOfCountriesAndStatesWithDistricts.get(countryName).keySet()){
                     CountryStateJSONGenerator.States statesWrapper = new CountryStateJSONGenerator.States();
                     statesWrapper.stateName = state;
                     List<CountryStateJSONGenerator.Districts> Districts = new List<CountryStateJSONGenerator.Districts>();
                     if(!mapOfCountriesAndStatesWithDistricts.get(countryName).get(state).isEmpty()){
                         for(String dis: mapOfCountriesAndStatesWithDistricts.get(countryName).get(state)){
                            CountryStateJSONGenerator.Districts District = new CountryStateJSONGenerator.Districts();
                            District.districtName = dis;
                            Districts.add(District);
                         }
                     }
                    statesWrapper.districts = Districts;
                    states.add(statesWrapper);
                }
             }
             CountryStateJSONGenerator.Country countryWrapper = new CountryStateJSONGenerator.Country();
             countryWrapper.countryName = countries[0].Name;
             countryWrapper.countryCode = (Integer)countries[0].Country_Code__c;
             countryWrapper.totalStatesNumber = (Integer)countries[0].Total_Number_of_States__c;
             countryWrapper.totalDistricts = (Integer)countries[0].Total_Number_of_Districts__c;
             countryWrapper.states = states;
 
             System.debug(countryWrapper);
             System.debug(JSON.serialize(countryWrapper));
 
             countries[0].Country_JSON_Data__c = JSON.serialize(countryWrapper);
             update countries[0];
         }
     }
     // Map fill using Single Query
     public static Map<String, Map<String, List<String>>>  singleQuaryMapFill(){
         List<District__c> listOfDistrictsStatesAndCountry=[
             Select Name, State__r.Name, State__r.Country__r.Name
             From District__c
            ];
         if(!listOfDistrictsStatesAndCountry.isEmpty()){
             for (District__c countryStateDistrict : listOfDistrictsStatesAndCountry) {
                 if(!mapOfCountriesAndStatesWithDistricts.containskey(countryStateDistrict.State__r.Country__r.Name)){
                    mapOfCountriesAndStatesWithDistricts.put(countryStateDistrict.State__r.Country__r.Name, new Map<String, List<String>>()); 
                 }
                if(!mapOfCountriesAndStatesWithDistricts.get(countryStateDistrict.State__r.Country__r.Name).containskey(countryStateDistrict.State__r.Name)){
                     mapOfCountriesAndStatesWithDistricts.get(countryStateDistrict.State__r.Country__r.Name).put(countryStateDistrict.State__r.Name, new List<String>());
                }
                if(!mapOfCountriesAndStatesWithDistricts.get(countryStateDistrict.State__r.Country__r.Name).get(countryStateDistrict.State__r.Name).contains(countryStateDistrict.Name)){
                    mapOfCountriesAndStatesWithDistricts.get(countryStateDistrict.State__r.Country__r.Name).get(countryStateDistrict.State__r.Name).add(countryStateDistrict.Name);
                }  
            }
         }
        System.debug('Map Of Country With States And Districts ->'+mapOfCountriesAndStatesWithDistricts);
        return mapOfCountriesAndStatesWithDistricts;
    }   
}