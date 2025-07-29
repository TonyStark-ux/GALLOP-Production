public class AccountTriggerHandler {


    public static void doAction(List<Account> triggernew){

            Map<Id,Account> idAccMap = new Map<Id,Account>();

            List<contact> conListToUpdate = new List<Contact>();


    for(Account acc:triggernew){
        idAccMap.put(acc.Id,acc);
    }

    List<Contact> conList = [Select Id, Phone from Contact where AccountId IN : idAccMap.keyset()];

    for(Contact con:conList){

        con.Phone=idAccMap.get(con.accountId).Phone;

        conListToUpdate.add(con);
    }

    if(!conListToUpdate.isEmpty()){

        Update conListToUpdate;

    }

    }



    
 

}