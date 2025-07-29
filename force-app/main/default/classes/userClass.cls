@RestResource(urlmapping='/user/active')

global with sharing class  userClass {


	Global class accoutWrapper{

		string accountId;
		string accountName;

	}

	@HttpGet
	global static List<accoutWrapper> accListReturn(){

			 List<accoutWrapper> acWrapperList = new List<accoutWrapper>();


		List<Account> accountList = [Select Id,Name from Account];


		for(Account acc :accountList){

			accoutWrapper a = new accoutWrapper ();
			a.accountId=acc.Id;
			a.accountName=acc.Name;

			acWrapperList.add(a);
		}

		return acWrapperList;
 

	}

}