<?php


class EmployeeFunctionPositionsForm extends mfForm {
        
    protected $functions=null;

    function configure()
    {
       $this->setValidators(array(
           'positions'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('positions'))),
       ));
     
    }
      
    function getOrdered()
    {
        
        return $this->functions=$this->functions===null?EmployeeFunction::getAllOrdered():$this->functions;
    }
    
     function getPositions()
    {
        return $this['positions']->getArray();
    }
}

