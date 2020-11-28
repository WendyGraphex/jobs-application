<?php


class EmployeeStudyLevelPositionsForm extends mfForm {
        
    protected $functions=null;

    function configure()
    {
       $this->setValidators(array(
           'positions'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('positions'))),
       ));
     
    }
      
    function getOrdered()
    {
        
        return $this->levels=$this->levels===null?EmployeeStudyLevel::getAllOrdered():$this->levels;
    }
    
     function getPositions()
    {
        return $this['positions']->getArray();
    }
}

