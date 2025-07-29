/**
* @File Name : getAccountList.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : April 15, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | April 15, 2025 |   | Initial Version
**/

public class getAccountList {
     @AuraEnabled(cacheable=true)
    public static List<Account> searchAccountsByName(String nameKeyword) {
        
        system.debug('Apex Called');
        if (String.isBlank(nameKeyword)) {
            return new List<Account>();
        }

        String namePattern =nameKeyword + '%';

        try {
            // Perform case-insensitive name search with FLS enforcement
            List<Account> accounts = [
                SELECT Id, Name, Phone 
                FROM Account 
                WHERE Name LIKE :namePattern 
            ];
            
            system.debug('accounts==>'+accounts);
            return accounts;
        } catch (Exception e) {
            // Optional: log error or handle
            System.debug('Error during SOQL search: ' + e.getMessage());
            return new List<Account>(); // return empty list on error
        }
    }
}