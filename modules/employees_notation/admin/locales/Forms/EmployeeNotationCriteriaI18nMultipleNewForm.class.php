<?php

class EmployeeNotationCriteriaI18nMultipleNewForm extends mfForm {
            
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
            "max"=>new mfValidatorInteger(), 
            'category_id'=>new mfValidatorCHoice(array('key'=>true,'required'=>false,'choices'=> EmployeeNotationCategory::getCategoriesByPositionForSelect()->unshift(array(''=>''))))
        ));
    }
    
    function getValues()
    {
        return $this['values']->getValue();
    }
    
    function getCategory()
    {
         if ($this['category_id']->getValue())
            return new EmployeeNotationCategory($this['category_id']->getValue());
         return null;
    }
    
    function getMax()
    {
        return $this['max']->getValue();
    }
}
