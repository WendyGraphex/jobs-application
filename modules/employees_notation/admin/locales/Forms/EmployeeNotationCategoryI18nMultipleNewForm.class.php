<?php

class EmployeeNotationCategoryI18nMultipleNewForm extends mfForm {
            
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
        ));
    }
    
    function getValues()
    {
        return $this['values']->getValue();
    }
}
