<?php


class CustomerContactFormatter extends mfFormatter {
   
    
      function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
     
     function getGender()
    {
        return format_gender($this->getValue()->get('gender'));
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
    function toArrayForEmail()
    {       
        $values=$this->getValue()->toArray();               
        $values['firstname']=(string)$this->getFirstname()->lower()->ucfirst();
        $values['lastname']=(string)$this->getLastname()->lower()->ucfirst();   
        $values['courtesy']=format_courtesy('Dear',$this->getValue()->getGender());        
        $values['gender']=array('full'=>format_gender($this->getValue()->getGender(),1,true,true),
                                'short'=>format_gender($this->getValue()->getGender(),1,false,true)
                               );               
        return $values;  
    }
    
}
