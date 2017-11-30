public with sharing class AccountListControllerExt {

	private final Account account;
    public final list<Product2> products { get; private set; }

    // The extension constructor initializes the private member
    // variable mysObject by using the getRecord method from the standard
    // controller.
    public AccountListControllerExt(ApexPages.StandardController stdController) {
        //this is an example of casting
        this.account = (Account)stdController.getRecord();
        this.products = [
            SELECT Id, Name, Family, IsActive, ProductCode
            FROM Product2
        ];
    }
}