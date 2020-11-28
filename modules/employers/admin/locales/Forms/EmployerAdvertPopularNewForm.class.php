<?php

 
 class EmployerAdvertPopularNewForm extends EmployerAdvertPopularBaseForm {
     

    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        //parent::__construct(array_merge(array('function_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        parent::configure();
        unset($this['id']);       
        
    }
 }

