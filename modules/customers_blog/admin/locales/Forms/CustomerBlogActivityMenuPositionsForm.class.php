<?php


class CustomerBlogActivityMenuPositionsForm extends mfForm {
        
     
    function configure()
    {
       $this->setValidators(array(
           'positions'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('positions'))),
       ));    
    }      
   
    
     function getPositions()
    {
        return $this['positions']->getArray();
    }
}

