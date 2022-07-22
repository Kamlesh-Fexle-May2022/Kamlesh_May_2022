/**
*  Description     :  Aggregate Result Class
*
*  Created By      :  Kamlesh Kumar
*
*  Created Date    :  07/14/2022
*
*  Revision Logs   :    V1.0 - Created - Kamlesh Kumar
**/
public with sharing class AggregateResults {
    //Update total numbers of states and districts On Country
    public static void  updateTotalNumbersOfStatesAndDistrictOnCountries() {
        List<AggregateResult> AggregateResult = [
            SELECT Country__c Country_Id,  COUNT(Id) Total_States, Sum(Total_number_of_Districts__c) Total_Districts FROM State__c
            GROUP BY Country__c
        ];
        List<Country__c> ListOfStatesRecords = new List<Country__c>();
        for(AggregateResult Agg : AggregateResult) {
            Integer toatalStates = (Integer)Agg.get('Total_States');
            Id CountryId = (Id)Agg.get('Country_Id');
            Decimal toatalDistrict = (Decimal)Agg.get('Total_Districts');
            Country__c countryObj= new Country__c();
            countryObj.Total_number_of_States__c = toatalStates;
            countryObj.Total_number_of_Districts__c = toatalDistrict;
            countryObj.Id = CountryId;
            ListOfStatesRecords.add(countryObj);
            
        }
        if(!ListOfStatesRecords.isEmpty()){
            update ListOfStatesRecords;
        }
    }
    // Uptade Total Numbers of Districts on States
    public static void  updateTotalNumbersOfDistrictOnStates() {
        List<AggregateResult> AggregateResult = [
            SELECT State__c State_Id, COUNT(Id) Total_Districts FROM District__c
            GROUP BY State__c
        ];
        List<State__c> ListOfDistrictsRecords = new List<State__c>();
        for(AggregateResult Agg : AggregateResult) {
            Integer toatalDistricts = (Integer)Agg.get('Total_Districts');
            Id CountryId = (Id)Agg.get('State_Id');
            State__c Stateobj = new State__c();
            Stateobj.Total_number_of_Districts__c = toatalDistricts;
            Stateobj.Id = CountryId;
            ListOfDistrictsRecords.add(Stateobj);
            
        }
        if(!ListOfDistrictsRecords.isEmpty()){
            update ListOfDistrictsRecords;
        }
    }
}