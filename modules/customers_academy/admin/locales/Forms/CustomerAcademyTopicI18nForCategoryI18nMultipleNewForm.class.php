<?php

class CustomerAcademyTopicI18nForCategoryI18nMultipleNewForm extends mfForm {
            
     protected $category_i18n=null;
    
    function __construct(CustomerCourseCategoryI18n $category_i18n,$defaults=array())
    {       
        $this->category_i18n=$category_i18n;        
        parent::__construct($defaults);
    }
    
    function getLanguage()
    {
      return $this['lang']->getValue();              
    }
    
       
function getCategoryI18n()
{
    return $this->category_i18n;
}    
   
    
    function configure() {
        if (!$this->getDefaults())
            $this->setDefault ('lang', $this->getCategoryI18n()->get('lang'));
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
