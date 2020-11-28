<?php


 class CustomerCourseCategoryNewForm extends mfForm {
         
     protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {              
        $this->language=$language;             
        parent::__construct(array_merge(array('category_i18n'=>array('lang'=>$language)),$defaults));
    }
          
     function getLanguage()
    {          
        if ($this->isValid())
            return $this['category_i18n']['lang']->getValue(); 
        return new Language($this->defaults['category_i18n']['lang']);
    }
    
    function configure()
    {       
        $this->embedForm('category', new CustomerCourseCategoryBaseForm($this->getDefault('category')));
        $this->embedForm('category_i18n', new CustomerCourseCategoryI18nBaseForm($this->getDefault('category_i18n')));      
        unset($this->category_i18n['id'],$this->category['id']);       
    }
       
    
}

