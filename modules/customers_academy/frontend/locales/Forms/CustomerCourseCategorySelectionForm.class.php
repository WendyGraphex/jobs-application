<?php


class CustomerCourseCategorySelectionForm extends mfForm {
    
    protected $node=null;
            
    function configure()
    {
        $this->setValidators(array(          
            'node'=>new mfValidatorInteger(array('required'=>false)),           
            'lang'=>new LanguagesExistsValidator(array(),'frontend'),
            'selection'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selection')),array('required'=>false)),
        ));      
    }        
    
    function getNode()
    {       
       if ($this->node===null)
       {    
        if ($this['node']->getValue())       
            $this->node=new CustomerCourseCategory($this['node']->getValue());         
        else
            $this->node=new CustomerCourseCategory('root');
       } 
        return $this->node;     
    }
    
    function getLanguage()
    {       
        return $this['lang']->getValue();       
    }
    
    function getSelection()
    {
        if ($this->isReady())
            return $this['selection']->getArray();
        return new mfArray($this->getDefault('selection'));
    }
}

