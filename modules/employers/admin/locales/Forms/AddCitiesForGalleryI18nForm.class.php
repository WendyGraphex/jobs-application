<?php

class AddCitiesForGalleryI18nForm extends mfForm {
    
    protected $item_i18n=null,$cities=null;
    
    function __construct(EmployerCityGalleryI18n $item_i18n,$defaults = array(), $options = array()) {
        $this->item_i18n=$item_i18n;
        parent::__construct($defaults, $options);
    }
    
    function getGalleryI18n()
    {
        return $this->item_i18n;
    }
    
    function configure() {
        $this->setValidators(array(
              'selection'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selection')),array('required'=>false)),             
        ));
    }  
    
    function getSelection()
    {
        return $this->cities=$this->cities===null?EmployerCityGalleryCity::getCitiesFromSelection($this['selection']->getArray()):$this->cities;
    }
}
