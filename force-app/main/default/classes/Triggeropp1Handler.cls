public class Triggeropp1Handler {
    Public static void oppStage(List<Opportunity>os){
        if(!os.isEmpty()){
            for(Opportunity obj:os){
                obj.LeadSource='Web';
            }
        }
        
        
    }
}