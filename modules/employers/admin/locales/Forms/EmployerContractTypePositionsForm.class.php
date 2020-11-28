<?php


class EmployerContractTypePositionsForm extends mfForm {
        
    protected $functions=null;

    function configure()
    {
       $this->setValidators(array(
           'positions'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('positions'))),
       ));
     
    }
      
    function getOrdered()
    {
        
        return $this->types=$this->types===null?EmployerContractType::getAllOrdered():$this->types;
    }
    
     function getPositions()
    {
        return $this['positions']->getArray();
    }
}

