/**
* @File Name : BatchClassDemo.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : July 20, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | July 20, 2025 |   | Initial Version
**/

public class BatchClassDemo implements Database.Batchable <Sobject>,Database.Stateful,Database.AllowsCallouts{


		List<Contact> conList = new List<Contact>();


	public Database.QueryLocator start(Database.BatchableContext bc){

		string query = 'Select Id, Name from Account';

		return Database.getQueryLocator(query);

	}

	public void execute(Database.BatchableContext bc, List<account> accList){


		for(Account acc:accList){
			Contact con = new Contact();
			con.accountId = acc.Id;
			con.LastName = acc.Name+' Batch';


			conList.add(con);
		}

		if(!conList.isEmpty()){

			List<Database.SaveResult> sr = Database.Insert(conList,false);

			for(Database.SaveResult s:sr){

				if(s.isSuccess()){

				}

				else{
					for(Database.error err:s.getErrors()){

					}
				}

			}

}

	}
		

	public void finish(Database.BatchableContext bc){

		//Database.executeBatch(new batchname(),200);

		system.enqueueJob(new QueueableClassDemo());

	}

}