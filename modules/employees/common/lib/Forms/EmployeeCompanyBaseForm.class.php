<?php


class EmployeeCompanyBaseForm extends mfForm {
    
               
    function configure() {              
        $this->setValidators(array(
            'id' => new mfValidatorInteger(),  
            'name' => new mfValidatorString(),                 
            'commercial' => new mfValidatorString(array("required"=>false)), 
            'email' => new mfValidatorEmail(array("required"=>false)), 
            'web' => new mfValidatorDomain(array("required"=>false)),            
            'address1' => new mfValidatorString(array("required"=>false)),
            'address2' => new mfValidatorString(array("required"=>false)),
            'phone' => new mfValidatorI18nPhone(array("culture"=>$this->getDefault('country'),"required"=>false)),
            'fax' => new mfValidatorI18nPhone(array("culture"=>$this->getDefault('country'),"required"=>false)),
            'city' => new mfValidatorString(array("required"=>false)),
            'postcode' => new mfValidatorString(array("required"=>false)),
            'country' => new mfValidatorI18nChoiceCountry(array("required"=>false)),
            'mobile' => new mfValidatorI18nMobile(array("culture"=>$this->getDefault('country'),"required"=>false)),
            'coordinates' => new mfValidatorCoordinates(array("required"=>false)),   
          //  'siret' => new mfValidatorString(array("required"=>false)),   
        ));                            
   
    }
    
  
}


