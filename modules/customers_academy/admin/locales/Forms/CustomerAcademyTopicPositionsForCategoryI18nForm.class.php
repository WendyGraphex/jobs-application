<?php


class CustomerAcademyTopicPositionsForCategoryI18nForm extends mfForm {
        
    protected $functions=null;

    function configure()
    {
       $this->setValidators(array(
           'positions'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('positions'))),
       ));
     
    }
      
    function getOrdered()
    {
        
        return $this->topics=$this->topics===null?CustomerAcademyTopic::getAllOrdered():$this->topics;
    }
    
     function getPositions()
    {
        return $this['positions']->getArray();
    }
}

