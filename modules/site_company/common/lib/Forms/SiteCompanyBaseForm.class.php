<?php


class SiteCompanyBaseForm extends mfForm {
    
                 
    function configure() {      
        
        if (!$this->hasDefault('country'))       
            $this->setDefault('country', 'FR');        
        $this->setValidators(array(
            'id' => new mfValidatorInteger(),  
            'name' => new mfValidatorName(),  
            'commercial' => new mfValidatorName(array("required"=>false)),         
            'email' => new mfValidatorEmail(), 
            'web' => new mfValidatorDomain(array("required"=>false)),            
            'address1' => new mfValidatorString(array("required"=>false)),
         //   'address2' => new mfValidatorString(array("required"=>false)),
            'phone' => new mfValidatorString(array("required"=>false)),
            'fax' => new mfValidatorString(array("required"=>false)),
            'city' => new mfValidatorString(array("required"=>false)),
            'postcode' => new mfValidatorString(array("required"=>false)),
            'country' => new mfValidatorI18nChoiceCountry(array("required"=>false)),
            'mobile' => new mfValidatorString(array("required"=>false)),
        //    'coordinates' => new mfValidatorCoordinates(array("required"=>false)),
            'picture'=> new mfValidatorFile(array(
                                    'required'=>false,
                                    'mime_types' => 'web_images',
                                    'max_size'=>500000,
                                                 )),
            'header'=> new mfValidatorFile(array(
                                    'required'=>false,
                                    'mime_types' => 'web_images',
                                    'max_size'=>500000,
                                                 )),
            'footer'=> new mfValidatorFile(array(
                                    'required'=>false,
                                    'mime_types' => 'web_images',
                                    'max_size'=>500000,
                                                 )),
            'siret'=>new mfValidatorSiret(array('required'=>false)),
            'tva'=>new mfValidatorTVA(array('required'=>false)),
            'ape'=>new mfValidatorNAF(array('required'=>false))  
        ));                            
       
    }
    
   
}


