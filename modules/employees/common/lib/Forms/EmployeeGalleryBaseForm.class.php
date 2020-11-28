<?php

 

 class EmployeeGalleryBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(                          
                                                                                                                                               
                'id' => new mfValidatorInteger(), 
                'name' => new mfValidatorString(),                              
                'tpl' => new mfValidatorString(array('required'=>false)),            
                'created_at' =>new mfValidatorI18nDate(array('required'=>false)),
                'updated_at' =>new mfValidatorI18nDate(array('required'=>false)),
            ) 
        );                      
    }
    
 
}


