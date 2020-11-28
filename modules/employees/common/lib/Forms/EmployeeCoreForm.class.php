<?php

 
 class EmployeeCoreForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(                          
                'username'=>new mfValidatorSecurePassword(array('min_length'=>8,
                                                                'max_length'=>'40','number_of_digit'=>2,
                                                                'special_list'=>"-_",
                                                                'number_of_upper'=>1,'must_match'=>true),
                                                         array(
                                                             'default'=>"The username must contain %s, %s, %s from list [%s]",
                                                             'invalid_default'=>"The username must contain "
                                                         )         
                            ),                                                                                                                    
                'id'=> new mfValidatorInteger(),                           
                'gender'=>new mfValidatorChoice(array("choices"=>array("Mrs"=>"Mrs","Mr"=>"Mr","Ms"=>"Ms"),"key"=>false,'required'=>true)),
                'firstname' => new mfValidatorString(array('required'=>true)),                
                'lastname' => new mfValidatorString(array('required'=>true)), 
                'email' => new mfValidatorEmail(array('required'=>true)),                                       
                'phone'=> new mfValidatorString(array('required'=>false)),                
                'mobile'=> new mfValidatorString(array()),         
                'fax'=> new mfValidatorString(array('required'=>false)),   
                'birthday' =>new mfValidatorI18nDate(array('required'=>false,'date_format'=>'a')),
                'address1'=>new mfValidatorString(array()),                
                'address2'=>new mfValidatorString(array('required'=>false)),
              //  'status'=>new mfValidatorString(array('required'=>false)),
                'postcode'=> new mfValidatorString(array()),         
                'city'=>new mfValidatorString(array()),                
                'country' => new mfValidatorI18nChoiceCountry(array("required"=>false)),
                'state'=>new mfValidatorString(array('required'=>false)),
                'web'=>new mfValidatorString(array('required'=>false)), 
                'avatar'=>new mfValidatorFile(array(
                    'required'=>false,
                    'mime_types' => 'web_images',
                    'max_size'=>2 *1024 * 1024,                                    
                                )
                ),
                'city' => new mfValidatorString(array('required'=>false)),
                'country' => new mfValidatorI18nChoiceCountry(array('required'=>false)),                
            ) 
        );                      
    }
    
 
}


