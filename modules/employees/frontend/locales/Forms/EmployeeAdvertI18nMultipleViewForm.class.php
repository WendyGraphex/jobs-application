<?php

require_once __DIR__."/EmployeeAdvertI18nMultipleNewForm.class.php";


class EmployeeAdvertI18nMultipleViewForm extends EmployeeAdvertI18nMultipleNewForm {
    
    
    function __construct(EmployeeAdvert $advert, $defaults = array(), $options = array()) {
        $this->advert=$advert;
        parent::__construct($advert->getEmployeeUser(), $defaults, $options);
    }
     
    function configure() {  
        if (!$this->getDefaults())
        {
             $this->setDefaults(array(
                // 'adverts'=>$this->getAdvert()->getAdvertsI18n()->toArray()
             ));
        }    
        parent::configure();   
        unset($this['id']);
    }   
        
    function getAdvert()
    {               
       $this->advert->add($this->isValid()?$this->getValues():$this->getDefaults());
       return $this->advert;       
    }
}

