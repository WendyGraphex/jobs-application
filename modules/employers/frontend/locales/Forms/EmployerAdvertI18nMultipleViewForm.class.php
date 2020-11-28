<?php

require_once __DIR__."/EmployerAdvertI18nMultipleNewForm.class.php";


class EmployerAdvertI18nMultipleViewForm extends EmployerAdvertI18nMultipleNewForm {
    
    
    function __construct(EmployerAdvert $advert, $defaults = array(), $options = array()) {
        $this->advert=$advert;
        parent::__construct($advert->getEmployerUser(), $defaults, $options);
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

