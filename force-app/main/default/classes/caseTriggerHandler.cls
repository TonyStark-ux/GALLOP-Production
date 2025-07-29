public class caseTriggerHandler {
	
	public static void doAction(List<Case> triggernew){
		set<Id>ownerIds = new Set<Id>();

		for(Case cas:triggernew){
			ownerIds.add(cas.ownerId);
		}

		List<User> useList = [Select Id, managerId,manager.Email from User where Id IN :ownerIds];

	}
}