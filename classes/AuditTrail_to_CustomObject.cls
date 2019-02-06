global class AuditTrail_to_CustomObject {
    
    public static void usertocon() {
        List<kcs_dev__Audit_Trail__c> Audit = new List<kcs_dev__Audit_Trail__c>();
        List<SetupAuditTrail> Setup = [SELECT Id,
                                       Action,
                                       CreatedBy.Name,
                                       CreatedDate,
                                       Display,
                                       Section 
                                       FROM SetupAuditTrail where CreatedDate=TODAY];
        System.debug('Setup' +setup);
         String s1;
        for (SetupAuditTrail u: Setup){
            kcs_dev__Audit_Trail__c c = new kcs_dev__Audit_Trail__c();
            if(u.Section=='Component' && u.Action=='createdApexComponent'){
                c.kcs_dev__Section__c='ApexComponent';
                s1=u.display;
                System.debug('s1'+s1);
                c.kcs_dev__Display__c=s1.substring(18,s1.length());
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Name;
                 Audit.add(c);
                
            }
            
            
          //  c.kcs_dev__Action__c = u.Action;
          //  c.kcs_dev__Display__c=u.display;
          //  c.kcs_dev__Created_Date__c=u.CreatedDate;
         //  c.kcs_dev__Created_By__c=u.CreatedBy.Name;
            
            System.debug('Audit____'+Audit);
        }
         //   Database.SaveResult[] results = Database.insert(Audit);
        insert Audit;
    } 
    
}