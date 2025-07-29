public class calloutClass {
    
    @AuraEnabled
    public static List<calloutResponseWrapper> callOutMethod(String pin){
        
        String requestBody='https://api.postalpincode.in/pincode/'+pin;
        
        HTTP http = new HTTP();
        HttpRequest req= new HttpRequest();
        
        req.setEndpoint(requestBody);
        req.setMethod('GET');
        
        HttpResponse res = new HttpResponse();
        
        
          List<calloutResponseWrapper> response = new List<calloutResponseWrapper>();
        
        try{
            res=http.send(req);
            if(res!=null && res.getStatusCode()==200){
                
                response = (List<calloutResponseWrapper>)JSON.deserialize(res.getBody(),List<calloutResponseWrapper>.class);
            }
        }
        catch(exception e){
            system.debug('ErrorMsg'+e.getMessage());
        }
        
        system.debug('response==>'+response);
        
        return response;
        
        
        
    }
    
}