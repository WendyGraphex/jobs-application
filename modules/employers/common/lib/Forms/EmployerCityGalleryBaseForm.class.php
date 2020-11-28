<?php

 

 class EmployerCityGalleryBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(                          
                                                                                                                                               
                'id' => new mfValidatorInteger(), 
                'name' => new mfValidatorString(),                              
                'tpl' => new mfValidatorString(array('required'=>false)),
                'number_of_items' => new mfValidatorInteger(),
            ) 
        );                      
    }
    
 
}


