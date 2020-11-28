<?php

class LanguageFrontendForm extends mfForm {         
    
    
    function __construct($language='en') 
    {       
        parent::__construct(array('lang'=>$language));
    }
    
    
    
    function configure()
    {
       $this->setValidator('lang', new mfValidatorChoice(array("choices"=>languageUtilsAdmin::getLanguages('frontend'))));         
    }
    
}


