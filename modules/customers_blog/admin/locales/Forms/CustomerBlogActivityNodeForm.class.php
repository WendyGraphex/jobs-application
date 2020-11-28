<?php


class CustomerBlogActivityNodeForm extends mfForm {
    
    protected $node=null;
            
    function configure()
    {
        $this->setValidators(array(          
            'node'=>new mfValidatorInteger(array('required'=>false)),           
            'lang'=>new LanguagesExistsValidator(array(),'frontend'),          
        ));      
    }        
    
    function getNode()
    {       
       if ($this->node===null)
       {    
        if ($this['node']->getValue())       
            $this->node=new CustomerBlogActivity($this['node']->getValue());         
        else
            $this->node=new CustomerBlogActivity('root');
       } 
        return $this->node;     
    }
    
    function getLanguage()
    {       
        return $this['lang']->getValue();       
    }
    
     
}

