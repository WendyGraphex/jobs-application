<?php


class SiteCityPositionsForm extends mfForm {
        
    protected $functions=null;

    function configure()
    {
       $this->setValidators(array(
           'positions'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('positions'))),
       ));
     
    }
      
    function getOrdered()
    {
        
        return $this->cities=$this->cities===null?SiteCity::getAllOrdered():$this->cities;
    }
    
     function getPositions()
    {
        return $this['positions']->getArray();
    }
}

