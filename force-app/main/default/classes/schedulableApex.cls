public class schedulableApex implements schedulable {
	public void execute(SchedulableContext sc){

		//BatchClassDemo myBatch = new BatchClassDemo();
		Database.executeBatch(new BatchClassDemo() ,200);


/*
Ananymous Window Code
schedulableApex myJob = new schedulableApex();
string cron ='0 0 1 * * ?';
system.schedule('Job details',cron,myJob);*/
		


	}
}