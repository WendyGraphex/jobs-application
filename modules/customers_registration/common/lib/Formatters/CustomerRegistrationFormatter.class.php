<?php


class CustomerRegistrationFormatter extends mfFormatter {
   
     function getName()
    {
        return $this->getFirstname()->lower()->ucfirst()." ".(string)$this->getLastname()->lower()->ucfirst();   
    }
    
    
    function getGender()
    {
        return format_gender($this->getValue()->get('gender'));
    }
   
      function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
     
    
    
     function getLastname()
    {
        return new mfString($this->getValue()->get('lastname'));
    }
    
    function getFirstname()
    {        
        return new mfString($this->getValue()->get('firstname'));
    }
    
      function getPhone()
    {
        return new mfString($this->getValue()->get('phone'));
    }
    
      function getCity()
    {
        return new mfString($this->getValue()->get('city'));
    }
    
       function getState()
    {
        return new mfString($this->getValue()->get('state'));
    }
    
     function getPostcode()
    {
        return new mfString($this->getValue()->get('postcode'));
    }
    
      function getCountry()
    {
        return new CountryFormatter($this->getValue()->get('country'));
    }
    
    function toArrayForEmail()
    {       
        $values=$this->getValue()->toArray();               
        $values['firstname']=(string)$this->getFirstname()->lower()->ucfirst();
        $values['lastname']=(string)$this->getLastname()->lower()->ucfirst();   
        $values['courtesy']=format_courtesy('Dear',$this->getValue()->getGender());        
        $values['gender']=array('full'=>format_gender($this->getValue()->getGender(),1,true,true),
                                'short'=>format_gender($this->getValue()->getGender(),1,false,true)
                               );    
        $values['country']=format_country($this->getValue()->get('country'));
        $values['has_experience']=__($this->getValue()->get('has_experience'));
        return $values;  
    }
}
