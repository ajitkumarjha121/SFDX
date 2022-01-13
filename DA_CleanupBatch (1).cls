//CreatedDate >= LAST_N_DAYS:30];
public class DA_CleanupBatch implements Database.Batchable<sObject>,Database.Stateful{
    private Integer batchObjectChain;
    public string strSelectedObj;
    public string queryObjectStr;
    public DA_CleanupBatch() {
    
        //strSelectedObj=strObject;
        batchObjectChain=1;
        queryObjectStr=getObjectQuery(batchObjectChain);
    } 
    
    public DA_CleanupBatch(Integer chainObjectInt) {
    
        queryObjectStr=getObjectQuery(chainObjectInt);
    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
        //String query = 'Select Id from ';NE__AssetItemAttribute__c 
         string userNmae='Order';
         string SrtObject=strSelectedObj;
         string strDays='30';
         //String query ='Select Id from '+SrtObject+' where CreatedDate <= LAST_N_DAYS:90 ';
        return Database.getQueryLocator(queryObjectStr);
    }
   
    public void execute(Database.BatchableContext BC,
                   list<SObject> recordsInScope) {
                    Set<string> setId = new set<string>();  
                  
              delete recordsInScope;
    
    }
   
    public void finish(Database.BatchableContext BC){
    //No Code
        if(batchObjectChain<=4) {
            DA_CleanupBatch mb = new DA_CleanupBatch(batchObjectChain+1);
            Database.executeBatch(mb, 200);
        }
    }
    
    public string getObjectQuery(Integer noOfObjectInt) {
        
        string userNmae='Order';
        string SrtObject;
        string strDays='30';
        String querySpecificObjectStr; //='Select Id from '+SrtObject+' where CreatedDate > LAST_N_DAYS:90 ';
        if(noOfObjectInt==1){
            SrtObject='NE__Order_Item_Attribute__c';
            querySpecificObjectStr='Select Id from '+SrtObject+' where CreatedDate < LAST_90_DAYS';
        }
        if(noOfObjectInt==2){
            SrtObject='NE__OrderItem__c';
            querySpecificObjectStr='Select Id from '+SrtObject+' where CreatedDate < LAST_90_DAYS';
        }
        if(noOfObjectInt==3){
            SrtObject='NE__AssetItemAttribute__c';
            querySpecificObjectStr='Select Id from '+SrtObject+' where CreatedDate < LAST_90_DAYS';
        }
        if(noOfObjectInt==4){
            SrtObject='Correspondence__c';
            querySpecificObjectStr='Select Id from '+SrtObject+' where CreatedDate < LAST_90_DAYS';
        }
        if(noOfObjectInt==5){
            SrtObject='Case';
            querySpecificObjectStr='Select Id from '+SrtObject+' where CreatedDate < LAST_90_DAYS';
        }
        return querySpecificObjectStr;      
        
    }   
    
}