public class AddproductHandler {
    public Static void accountUpdate(List<OpportunityLineItem> ProductsLst){
        Set<Id> setOfProductIds = new set<Id>(); 
        for(OpportunityLineItem obj:ProductsLst) {
             setOfProductIds.add(obj.Id);
        } 
    }
}