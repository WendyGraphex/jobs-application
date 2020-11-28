<?php

class LanguageAdminForm extends mfForm {         
    
     
    function __construct($language='en') 
    {       
        parent::__construct(array('lang'=>$language));
    }
    
    
    function configure()
    {     
       $this->setValidator('lang',new LanguagesExistsValidator(array(),'admin'));      
    }
    
    
}


