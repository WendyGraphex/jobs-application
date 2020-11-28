<?php


class CustomerAcademySoftwarePositionsForCategoryI18nForm extends mfForm {
        
    protected $functions=null;

    function configure()
    {
       $this->setValidators(array(
           'positions'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('positions'))),
       ));
     
    }
      
    function getOrdered()
    {
        
        return $this->softwares=$this->softwares===null?CustomerAcademySoftware::getAllOrdered():$this->softwares;
    }
    
     function getPositions()
    {
        return $this['positions']->getArray();
    }
}

