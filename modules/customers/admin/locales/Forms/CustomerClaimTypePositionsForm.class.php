<?php


class CustomerClaimTypePositionsForm extends mfForm {
        
    protected $types=null;

    function configure()
    {
       $this->setValidators(array(
           'positions'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('positions'))),
       ));
     
    }
      
    function getOrdered()
    {
        
        return $this->types=$this->types===null?CustomerClaimType::getAllOrdered():$this->types;
    }
    
     function getPositions()
    {
        return $this['positions']->getArray();
    }
}

