<?php

 
 class EmployerUserBaseForm extends EmployerUserCoreForm {
 
   
    function configure()
    {
        parent::configure();
        $this->addValidators(array(                                                         
                'birthday' =>new mfValidatorI18nDate(array('required'=>false,'date_format'=>'a')),
                'address1'=>new mfValidatorString(array()),                
                'address2'=>new mfValidatorString(array('required'=>false)),              
                'postcode'=> new mfValidatorString(array()),         
                'city'=>new mfValidatorString(array()),                
                'country' => new mfValidatorI18nChoiceCountry(array()),
                'state'=>new mfValidatorString(array('required'=>false)), 
                'web'=>new mfValidatorString(array('required'=>false)), 
            ) 
        );                      
    }
    
 
}


