trigger leadSync on Lead (before insert) {
    if(trigger.isInsert){
        map<string,Lead> mapOfEmailVsLEad = new map<string,Lead>();
        Set<String> SetofEmail = new Set<String>();
        for(Lead objlead:trigger.new){
            if(mapOfEmailVsLEad.containsKey(objlead.Email)){
				mapOfEmailVsLEad.put(objlead.Email,objlead);	
            }else{
                objlead.addError('Another lead has same email address');
            }
        }
        List<Lead> lstofLeads = new List<Lead>();
        For(Lead objld :[select id,email,name from Lead where email in:mapOfEmailVsLEad.keyset()]){
              objld.LastName=mapOfEmailVsLEad.get(objld.Email).name;
            lstofLeads.add(objld);
            
        }
        update lstofLeads;
            }
}