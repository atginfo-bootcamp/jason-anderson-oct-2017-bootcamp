@isTest
private class apexBootCampUnitTest {
	
	@isTest static void test_method_one() {
		// Implement test code
		List<Lead> kingsList = [SELECT Name, Title FROM Lead WHERE Title = 'Sausage King of Chicago'];
		
		//System.assert(kingsList != null, 'This code doesnt work');



		//String idealTitle = 'Sausage King of Chicago';
		String idealTitle = 'Queen';

		for(Lead lead : kingsList){
		//System.assertEquals (kingsList[0].Title, idealTitle, 'It\'s good to be king');

		System.assertNotEquals (Lead.Title, idealTitle, 'It\'s good to be Queen');
	}
}

	
	@isTest static void test_method_two() {
		// Implement test code
	

	}
	
}