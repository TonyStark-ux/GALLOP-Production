public class calloutResponseWrapper {
    
    public string Message;
    public string Status;
    public List<PostOffice> PostOffice;
    
    public class PostOffice{
        public string Name;
        public string Description;
        public string BranchType;
        public string DeliveryStatus;
        public string Circle;
        public string District;
        public string Division;
        public string Region;
        public string State;
        public string Country;
        
    }
    
}