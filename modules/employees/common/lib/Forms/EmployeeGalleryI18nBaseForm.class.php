<?php

 class EmployeeGalleryI18nBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(                                                                                                                                                                         
                'id' => new mfValidatorInteger(), 
                'title' => new mfValidatorString(),                              
                'lang'=>new LanguagesExistsValidator(array(),'frontend'), 
        ));                      
    }
    
 
}


