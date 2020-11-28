<?php

class EmployeePortfolioDocumentI18nMultipleForm extends mfForm {
    
    protected $document=null;
    
    function __construct(EmployeePortfolioDocument $document,$options=array())
    {       
        $this->document=$document;
        parent::__construct($options);       
    }
    
    function getDocument()
    {
        return $this->document;
    }
    
    function getEmployeeUser()
    {
        return $this->getDocument()->getEmployeeUser();   
    }
     
    function configure() {
           
          $this->createEmbedFormForEach('i18n','EmployeePortfolioDocumentI18nForm', $this->getLanguages()->count());    
    }
    
    function getLanguages()
    {
        return $this->languages=$this->languages===null?LanguageUtils::getActiveLanguagesFrontendByPosition():$this->languages;
    }
    
    function getValues()
    {      
        $values=new mfArray();
        foreach ($this['i18n']->getValue() as $value)
            $values[$value['lang']]=$value;
        return $values;     
    }
}
