<?php


class EmployerSearchQueryForm extends mfForm {
    
    
    function configure() {
        $this->setValidators(array(
            'category'=> new mfValidatorChoice(array('required'=>false,'key'=>true,'choices'=>EmployerWorkCategory::root()->getChildren()->toSelect()->unshift(array(''=>__('Select a category'))))),
            'query'=>new mfValidatorString(),
            'location'=>new mfValidatorString(array('required'=>false)), 
            'city'=>new mfValidatorString(array('required'=>false)), 
            'country'=>new mfValidatorString(array('required'=>false)), 
        ));
    }
    
    function hasCategory()
    {
        return $this['category']->getValue();
    }
    
    function getCategory()
    {
        return $this->_category=$this->_category===null?new EmployerWorkCategory($this['category']->getValue()):$this->_category;
    }
    
    function hasCountry()
    {
        return $this['country']->getValue();
    }
    
    function getCountries()
    {
        return $this['country']->getArray();
    }
    
    function getCity()
    {
        return $this['city']->getValue();
    }
    
    function getSearch()
    {
      $values=new mfArray();
      $values[]=$this['query']->getValue();
      if ($this['category']->getValue())          
          $values[]=$this->getCategory()->getI18n()->getFormatter()->getTitle()->ucfirst();
      if ($this['location']->getValue())
          $values[]=$this['location']->getValue();           
     return $values;   
    }
    
    function getQuery()
    {
        return new mfArray(explode(" ",$this['query']->getValue()));
    }
    
      function getValues()
    {
        $values=parent::getValues();
        $values['category_id']=$this['category']->getValue();
        return $values;
    }
}


