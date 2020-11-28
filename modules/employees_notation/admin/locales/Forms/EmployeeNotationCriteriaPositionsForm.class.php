<?php


class EmployeeNotationCriteriaPositionsForm extends mfForm {
        
    protected $functions=null;

    function configure()
    {
       $this->setValidators(array(
           'positions'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('positions'))),
       ));
     
    }
      
    function getOrdered()
    {
        
        return $this->languages=$this->languages===null?EmployeeNotationCriteria::getAllOrdered():$this->languages;
    }
    
     function getPositions()
    {
        return $this['positions']->getArray();
    }
}

