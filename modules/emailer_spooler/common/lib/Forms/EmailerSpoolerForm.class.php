<?php



 class EmailerSpoolerSettingsForm extends mfForm {
 
   
  
    function configure()
    {       
        $this->setValidators(array(            
          
            "number_of_emails"=>new mfValidatorInteger(array('min'=>1,'max'=>50)),           
            ) 
        );                              
    }
    
    
   
}


