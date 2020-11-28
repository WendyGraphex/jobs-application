<?php


class EmployerActivityPositionsForm extends mfForm {
        
    protected $functions=null;

    function configure()
    {
       $this->setValidators(array(
           'positions'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('positions'))),
       ));
     
    }
      
    function getOrdered()
    {
        
        return $this->activities=$this->activities===null?EmployerActivity::getAllOrdered():$this->activities;
    }
    
     function getPositions()
    {
        return $this['positions']->getArray();
    }
}

