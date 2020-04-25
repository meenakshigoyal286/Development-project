public class TriggerCase1Handler {
public static void caseStatus(List<Case>cs){
if(!cs.isEmpty()){
for(Case obj : cs){
if(obj.Origin=='Email'){
obj.Status='New';
obj.Priority='Medium';

}
}
}
}

}