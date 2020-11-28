<?php

 
 class EmployerUserCoreForm extends mfForm {
 
   
    function configure()
    {       
        $this->setValidators(array(                      
                'id'=> new mfValidatorInteger(),  
                'gender'=>new mfValidatorChoice(array("choices"=>array("Mrs"=>"Mrs","Mr"=>"Mr","Ms"=>"Ms"),"key"=>true)),
                'firstname' => new mfValidatorString(), 
                'username'=>new mfValidatorSecurePassword(array( 
                                                                'min_length'=>8,
                                                                'max_length'=>'40',
                                                                'number_of_digit'=>2,
                                                                'special_list'=>"-_",
                                                                'number_of_upper'=>1,
                                                                'must_match'=>true),
                                                         array(
                                                             'default'=>"The username must contain %s, %s, %s from list [%s]",
                                                             'invalid_default'=>"The username must contain "
                                                         )         
                            ),  
                'lastname' => new mfValidatorString(), 
                'email' => new mfValidatorEmail(),                                       
                'phone'=> new mfValidatorString(array('required'=>false)),                
                'mobile'=> new mfValidatorString(),         
                'fax'=> new mfValidatorString(array('required'=>false)),   
                'avatar'=>new mfValidatorFile(array(
                    'required'=>false,
                    'mime_types' => 'web_images',
                    'max_size'=>2 * 1024 * 1024,                                    
                                 )
                ),                
            ) 
        );         
    }
    
 
}


