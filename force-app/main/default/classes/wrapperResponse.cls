/**
* @File Name : wrapperResponse.cls
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

public class wrapperResponse {
	@AuraEnabled
	public static void LightningStudio(){
		System.debug('Lightning Studio');
	}
}