<?php


class EmployerCompanyBaseForm extends mfForm {
    
               
    function configure() {               
        $this->setValidators(array(
            'id' => new mfValidatorInteger(),  
             'name' => new mfValidatorString(),                 
            'commercial' => new mfValidatorString(array("required"=>false)), 
            'email' => new mfValidatorEmail(array("required"=>false)), 
            'web' => new mfValidatorDomain(array("required"=>false)),
            'logo'=>new mfValidatorFile(array(
                                'required'=>false,
                                'mime_types' => 'web_images',
                                'max_size'=>2 * 1024 * 1024,                                    
                                             )
                            ), 
            'picture'=>new mfValidatorFile(array(
                                'required'=>false,
                                'mime_types' => 'web_images',
                                'max_size'=>2 * 1024 * 1024,                                    
                                             )
                            ),  
            'address1' => new mfValidatorString(array("required"=>false)),
            'address2' => new mfValidatorString(array("required"=>false)),
            'phone' => new mfValidatorI18nPhone(array("culture"=>$this->getDefault('country'),"required"=>false)),
            'fax' => new mfValidatorI18nPhone(array("culture"=>$this->getDefault('country'),"required"=>false)),
            'city' => new mfValidatorString(array("required"=>false)),
            'postcode' => new mfValidatorString(array("required"=>false)),
            'state' => new mfValidatorString(array("required"=>false)),
            'country' => new mfValidatorI18nChoiceCountry(array("required"=>false)),
            'mobile' => new mfValidatorI18nMobile(array("culture"=>$this->getDefault('country'),"required"=>false)),
            'coordinates' => new mfValidatorCoordinates(array("required"=>false)),   
            'registration'=>new mfValidatorString(array()),
        ));                            
   
    }
    
  
}


