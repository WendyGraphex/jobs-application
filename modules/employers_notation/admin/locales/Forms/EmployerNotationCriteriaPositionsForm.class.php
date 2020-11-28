<?php


class EmployerNotationCriteriaPositionsForm extends mfForm {
        
    protected $functions=null;

    function configure()
    {
       $this->setValidators(array(
           'positions'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('positions'))),
       ));
     
    }
      
    function getOrdered()
    {
        
        return $this->languages=$this->languages===null?EmployerNotationCriteria::getAllOrdered():$this->languages;
    }
    
     function getPositions()
    {
        return $this['positions']->getArray();
    }
}

