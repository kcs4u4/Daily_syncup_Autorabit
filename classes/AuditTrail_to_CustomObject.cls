global class AuditTrail_to_CustomObject {
    
    public static void usertocon() {
        List<kcs_dev__Audit_Trail__c> Audit = new List<kcs_dev__Audit_Trail__c>();
        List<SetupAuditTrail> Setup = [SELECT Id,
                                       Action, CreatedBy.Name, CreatedBy.id, CreatedBy.Email, CreatedDate,Display,
                                       Section FROM SetupAuditTrail where CreatedDate=TODAY AND HOUR_IN_DAY(CreatedDate) > 1 ];
        System.debug('Setup' +setup);
        String SString;
        for (SetupAuditTrail u: Setup){
            kcs_dev__Audit_Trail__c c = new kcs_dev__Audit_Trail__c();
            
            if(u.Section=='Component' ){
                c.kcs_dev__Section__c='ApexComponent';
                SString=u.display;
                c.kcs_dev__Display__c=SString.substringAfter('Component');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            /*if(u.Section=='Component' && u.Action=='deletedApexComponent'){
                c.kcs_dev__Section__c='ApexComponent';
                SString=u.display;
                c.kcs_dev__Display__c=SString.substring(18,SString.length());
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                Audit.add(c);
            } */
            if(u.Section=='Apex Class' && u.Action=='createdApexClass'){
                c.kcs_dev__Section__c='ApexClass';
                SString=u.display;
                c.kcs_dev__Display__c=SString.substringBetween('Created ',' Apex Class code');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            } 
            if(u.Section=='Apex Class' && u.Action=='changedApexClass'){
                c.kcs_dev__Section__c='ApexClass';
                SString=u.display;
                c.kcs_dev__Display__c=SString.substringBetween('Changed ',' Apex Class code');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            if(u.Section=='Apex Class' && u.Action=='deletedApexClass'){
                c.kcs_dev__Section__c='ApexClass';
                SString=u.display;
                c.kcs_dev__Display__c=SString.substringBetween('Deleted ',' Apex Class code');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            if(u.Section=='Page'){
                c.kcs_dev__Section__c='ApexPage';
                SString=u.display;
                c.kcs_dev__Display__c=SString.substringAfter('Page ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
           /* if(u.Section=='Page' && u.Action=='ChangedApexPage'){
                c.kcs_dev__Section__c='ApexPage';
                SString=u.display;
                c.kcs_dev__Display__c=SString.substringAfter('Changed Page ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            if(u.Section=='Page' && u.Action=='deletedApexPage'){
                c.kcs_dev__Section__c='ApexPage';
                SString=u.display;
                c.kcs_dev__Display__c=SString.substringAfter('Deleted Page ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            } */
              if(u.Section=='Apex Trigger'){
                c.kcs_dev__Section__c='ApexTrigger';
                SString=u.display;
                c.kcs_dev__Display__c=SString.substringAfter('Trigger code: ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
           /* if(u.Section=='Apex Trigger' && u.Action=='ChangedApexTrigger'){
                c.kcs_dev__Section__c='ApexTrigger';
                SString=u.display;
                c.kcs_dev__Display__c=SString.substringAfter('Trigger code: ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
             if(u.Section=='Apex Trigger' && u.Action=='deletedApexTrigger'){
                c.kcs_dev__Section__c='ApexTrigger';
                SString=u.display;
                c.kcs_dev__Display__c=SString.substringAfter('Trigger code: ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            } */
            if(u.Section=='Reporting Snapshots' && u.Action=='createdReportJob'  ){
                c.kcs_dev__Section__c='AnalyticSnapshot';  
                SString=u.display;
                c.kcs_dev__Display__c=SString.substringAfter('Created reporting snapshot ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            
   
            
            System.debug('Audit____'+Audit);
        }
           Database.SaveResult[] results = Database.insert(Audit);
       // insert Audit;
    } 
    
}