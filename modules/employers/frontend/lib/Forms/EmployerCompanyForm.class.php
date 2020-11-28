<?php

class EmployerCompanyForm extends mfForm {

     function configure() {
              $this->setValidators(array(
            'id' => new mfValidatorInteger(),  
            'name' => new mfValidatorString(),         
            'commercial' => new mfValidatorString(array("required"=>false)) ,                                 
            'email' => new mfValidatorEmail(array("required"=>false)), 
            'web' => new mfValidatorDomain(array("required"=>false)),            
            'address1' => new mfValidatorString(),
            'address2' => new mfValidatorString(array("required"=>false)),
            'phone' => new mfValidatorString(),                    
            'city' => new mfValidatorString(),
            'postcode' => new mfValidatorString(),
            'state' => new mfValidatorString(array("required"=>false)),
            'country' => new mfValidatorI18nChoiceCountry(),
            'mobile' => new mfValidatorString(array("required"=>false)),          
            'picture'=>new mfValidatorFile(array('max_size'=>4 * 1024 * 1024,'required'=>false)),
            'logo'=>new mfValidatorFile(array('max_size'=>4 * 1024 * 1024,'required'=>false)),            
             ));   
          }
}