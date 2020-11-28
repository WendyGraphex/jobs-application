<?php


class SaleQuotationStatePositionsForm extends mfForm {
        
    protected $states=null;

    function configure()
    {
       $this->setValidators(array(
           'positions'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('positions'))),
       ));
     
    }
      
    function getOrdered()
    {
        
        return $this->states=$this->states===null?SaleQuotationState::getAllOrdered():$this->states;
    }
    
     function getPositions()
    {
        return $this['positions']->getArray();
    }
}

