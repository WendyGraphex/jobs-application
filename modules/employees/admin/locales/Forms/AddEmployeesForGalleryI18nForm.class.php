<?php

class AddEmployeesForGalleryI18nForm extends mfForm {
    
    protected $item_i18n=null;
    
    function __construct(EmployeeGalleryI18n $item_i18n,$defaults = array(), $options = array()) {
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
        return $this->_selection=$this->_selection===null?EmployeeGalleryEmployee::getEmployeesFromSelection($this['selection']->getArray()):$this->_selection;
    }
}
