<?php


class EmployerBudgetUnitPositionsForm extends mfForm {
        
    protected $functions=null;

    function configure()
    {
       $this->setValidators(array(
           'positions'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('positions'))),
       ));
     
    }
      
    function getOrdered()
    {
        
        return $this->units=$this->units===null?EmployerBudgetUnit::getAllOrdered():$this->units;
    }
    
     function getPositions()
    {
        return $this['positions']->getArray();
    }
}

