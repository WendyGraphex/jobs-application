<?php

class CustomerBlogActivityI18nMultipleNewForm extends mfForm {
            
     protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('lang'=>$this->language),$defaults));
    }
           
    function getLanguage()
    {
        if ($this->isValid())     
            return $this['lang']->getValue();        
        return $this->language;
    }
    
    
    function configure() {
        $this->setValidators(array(
            'values'=>new mfValidatorMultiple(new mfValidatorString(array('trim'=>true)),array('remove_space'=>false)),
            "lang"=> new LanguagesExistsValidator(array(),'frontend'),
             'node'=>new ObjectExistsValidator('CustomerBlogActivity',array('key'=>false)),     
        ));
    }
    
    function getValues()
    {
        return $this['values']->getValue();
    }
    
      function getNode()
    {      
       return  $this->_node=$this->_node===null?($this->hasErrors()?new CustomerBlogActivity($this['node']->getValue()): $this['node']->getValue()):$this->_node;            
    }
    
    
    function getCollection()
    {
        if ($this->collection===null)
        {           
            $nodes = new CustomerBlogActivityCollection();
            foreach ($this->getValues() as $value)
            {               
                $nodes[]=$this->getNode()->create()->save();             
            }            
            $this->collection = new CustomerBlogActivityI18nCollection();
            foreach ($this['values']->getValue() as $index=>$value)
            {
                $i18n= new CustomerBlogActivityI18n();
                $i18n->add(array('activity_id'=>$nodes[$index],
                                 'title'=>$value,
                                 'meta_title'=>$value,
                                 'lang'=>$this->getLanguage()
                            ));
                $i18n->generateUrl(); 
                $this->collection[]=$i18n;
            }             
        }
        return $this->collection;
    }
}
