global class AuditTrail_to_CustomObject {
    
    public static void usertocon() {
        List<kcs_dev__Audit_Trail__c> Audit = new List<kcs_dev__Audit_Trail__c>();
        List<SetupAuditTrail> Setup = [SELECT Id,
                                       Action,
                                       CreatedBy.Name,
                                       CreatedBy.id,
                                       CreatedBy.Email,
                                       CreatedDate,
                                       Display,
                                       Section 
                                       FROM SetupAuditTrail where CreatedDate=TODAY AND HOUR_IN_DAY(CreatedDate) > 1 ];
        System.debug('Setup' +setup);
        String s1;
        for (SetupAuditTrail u: Setup){
            kcs_dev__Audit_Trail__c c = new kcs_dev__Audit_Trail__c();
            
            if(u.Section=='Reporting Snapshots' && u.Action=='createdReportJob'  ){
                c.kcs_dev__Section__c='AnalyticSnapshot';  
                s1=u.display;
                c.kcs_dev__Display__c=s1.substringAfter('Created reporting snapshot ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            if(u.Section=='Component' && u.Action=='createdApexComponent'){
                c.kcs_dev__Section__c='ApexComponent';
                s1=u.display;
                c.kcs_dev__Display__c=s1.substring(18,s1.length());
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            if(u.Section=='Component' && u.Action=='changedApexComponent'){
                c.kcs_dev__Section__c='ApexComponent';
                s1=u.display;
                c.kcs_dev__Display__c=s1.substring(18,s1.length());
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            if(u.Section=='Component' && u.Action=='deletedApexComponent'){
                c.kcs_dev__Section__c='ApexComponent';
                s1=u.display;
                c.kcs_dev__Display__c=s1.substring(18,s1.length());
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                Audit.add(c);
            }
            if(u.Section=='Apex Class' && u.Action=='createdApexClass'){
                c.kcs_dev__Section__c='ApexClass';
                s1=u.display;
                c.kcs_dev__Display__c=s1.substringBetween('Created ',' Apex Class code');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            if(u.Section=='Apex Class' && u.Action=='changedApexClass'){
                c.kcs_dev__Section__c='ApexClass';
                s1=u.display;
                c.kcs_dev__Display__c=s1.substringBetween('Changed ',' Apex Class code');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            if(u.Section=='Apex Class' && u.Action=='deletedApexClass'){
                c.kcs_dev__Section__c='ApexClass';
                s1=u.display;
                c.kcs_dev__Display__c=s1.substringBetween('Deleted ',' Apex Class code');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            if(u.Section=='Page' && u.Action=='createdApexPage'){
                c.kcs_dev__Section__c='ApexPage';
                s1=u.display;
                c.kcs_dev__Display__c=s1.substringAfter('Created Page ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            if(u.Section=='Page' && u.Action=='ChangedApexPage'){
                c.kcs_dev__Section__c='ApexPage';
                s1=u.display;
                c.kcs_dev__Display__c=s1.substringAfter('Changed Page ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            if(u.Section=='Page' && u.Action=='deletedApexPage'){
                c.kcs_dev__Section__c='ApexPage';
                s1=u.display;
                c.kcs_dev__Display__c=s1.substringAfter('Deleted Page ');
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