<?php

class CustomerBlogActivitiesAddForm extends mfForm {
    
   
    function configure()
    {
        $this->setValidators(array(            
             'selection'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selection')),array('required'=>false)),
        ));        
    }
    
    function getSelection()
    {
        return CustomerBlogActivity::getActivitiesFromSelection($this['selection']->getArray());
    }
       
}

