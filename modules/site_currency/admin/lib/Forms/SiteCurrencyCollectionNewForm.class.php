<?php


class SiteCurrencyCollectionNewForm extends mfForm {

        
    function configure() { 
        $this->setDefault('count', $this->getDefault('count',2)); // Number of form fields by default 
        $this->setValidator('count',new mfValidatorInteger(array('min'=>1,"max"=>10)));
        $this->embedFormForEach('collection',new SiteCurrencyNewForm($this->site),$this->getDefault('count')); 
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    function check($validator,$values)
    {
      return $values;
     
    }
}