<?php

 

 class PartnerWorkCategoryMenuBaseForm extends mfForm {
 
   
    function configure()
    {       
        $this->setValidators(array(                                        
                'id'=> new mfValidatorInteger(),                
                'name' => new mfValidatorString(array('required'=>false)),       
            ) 
        );                      
    }
    
 
}


