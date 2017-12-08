public with sharing class BackToTheFuture {

	public static void execute() {

		System.debug('We are going back to the future');

		goDoSomeWorkInTheFuture();

		System.debug('We are going back from the future....');
	}

	//cacn only take primitave data types list or set of primitive data types
	@future
	public static void goDoSomeWorkInTheFuture() {

		System.debug('We are in the future!!!!');
	}


}