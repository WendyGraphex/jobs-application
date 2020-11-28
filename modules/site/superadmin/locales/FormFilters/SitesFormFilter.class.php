<?php

class SitesFormFilter extends mfFormFilterBase {
 
    function configure()
    {
        $this->setDefaults(array(
            'order'=>array(
                            "site_id"=>"asc",
            ),
            'search'=>array(
                         
            ),
            'nbitemsbypage'=>"*",
       ));
       // Base Query
       $this->setQuery("SELECT * FROM ".Site::getTable().";");
       // Validators 
       $this->setValidators(array(
            'order' => new mfValidatorSchema(array(
                            "site_id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "site_host"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "site_db_name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "site_admin_theme"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "site_frontend_theme"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "site_type"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                           ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                              "site_id"=>new mfValidatorInteger(array("required"=>false)),   
                              "site_host"=>new mfValidatorString(array("required"=>false)),   
                              "site_db_name"=>new mfValidatorString(array("required"=>false)),  
                              "site_admin_available"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO"),"required"=>false)),
                              "site_frontend_available"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO"),"required"=>false)),
                              "site_available"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO"),"required"=>false)),
                           ),array("required"=>false)),
           'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>5,"10"=>10,"20"=>20,"50"=>50,"100"=>100,"500"=>500,"*"=>"*"))),         
        ));
    }
    
 
}

