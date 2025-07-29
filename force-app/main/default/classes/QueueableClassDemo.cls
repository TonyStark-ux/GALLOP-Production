/**
* @File Name : QueueableClassDemo.cls
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

public class QueueableClassDemo implements Queueable, Database.AllowsCallouts{

	public void execute(QueueableContext qc){

		Http http = new Http();

		HttpRequest req= new HttpRequest();
		req.setEndpoint('callout:MynamedCredentials/');
		req.setHeader('content-Type','application/json');
		req.setHeader('Authorization', 'BearerToken');
		req.setMethod('GET');
		req.setTimeout(2000);


		HttpResponse res = new HttpResponse();

		try{
			res = http.send(req);

			if(res.getStatusCode()==200){

			//	WrapperResponse wr =  WrapperResponse.jsonConversion(res);

			//	String email = wr.Profile.email;

				//Process Code
			}
			else{

				//failedCalloutLog__c fc = new  failedCalloutLog__c();


			}
		}
		catch(exception e){
			system.debug(e.getMessage());
		}

	}
	
}