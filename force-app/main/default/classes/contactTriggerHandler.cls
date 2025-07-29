public class contactTriggerHandler {
	
	public static void doAction(List<contact> triggernew){

		List<Account> acclisttoUpdate = new List<Account>();

		Set<Id> accIds = new Set<Id>();

		for(Contact con:triggernew){
			accIds.add(con.accountId);
		}

		List<AggregateResult> agr = [Select count(id)conCount, AccountId from Contact where AccountId IN:accIds group by AccountId];

for(AggregateResult ar:agr){
	Account acc = new Account();
	//acc.CountofContacts = (decimal)ar.get('conCount');
	acc.Id = (Id)ar.get('AccountId');
	acclisttoUpdate.add(acc);

}

if(!acclisttoUpdate.isEmpty())

Update acclisttoUpdate;
	
	}
}