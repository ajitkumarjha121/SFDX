//CreatedDate >= LAST_N_DAYS:30];
public class DA_CleanupBatch implements Database.Batchable<sObject>{

    public Database.QueryLocator start(Database.BatchableContext BC) {
        //String query = 'Select Id from ';
         string userNmae='Order';
         string strDays='30';
          String query ='Select Id from Test_Bonitat__c';
        return Database.getQueryLocator(query);
    }
   
    public void execute(Database.BatchableContext BC,
                   list<Test_Bonitat__c> recordsInScope) {
                    Set<string> setId = new set<string>();  
                  
              delete recordsInScope;
          
           
            
       
    }
   
    public void finish(Database.BatchableContext BC){
    //No Code
    }
   
}