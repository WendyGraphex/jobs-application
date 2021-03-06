<?php


class CustomerAcademyNewsletterFormatter extends mfFormatter {
   
    
    
    function getUser()
    {
        return new mfString((string)$this->getValue());
    }
    
    function getLastname()
    {
        return new mfString($this->getValue()->get('lastname'));
    }
    
    function getFirstname()
    {        
        return new mfString($this->getValue()->get('firstname'));
    }        
    
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
    
//     function getBirthday()
//    {
//        return new DateFormatter($this->getValue()->get('birthday'));
//    }
    
    function getPhone()
    {
        return new mfString($this->getValue()->get('phone'));
    }
    
     function getCountry()
    {
        return new CountryFormatter($this->getValue()->get('country'));
    }
    
    function toArrayForEmail()
    {       
        $values=$this->getValue()->toArray();         
        $values['name']=(string)$this->getFirstname()->lower()->ucfirst()." ".(string)$this->getLastname()->lower()->ucfirst();   
        $values['firstname']=(string)$this->getFirstname()->lower()->ucfirst();
        $values['lastname']=(string)$this->getLastname()->lower()->ucfirst();   
        $values['courtesy']=format_courtesy('Dear',$this->getValue()->get('gender'));        
        $values['gender']=array('full'=>format_gender($this->getValue()->get('gender'),1,true,true),
                                'short'=>format_gender($this->getValue()->get('gender'),1,false,true)
                               );        
        return $values;  
    }
    
    
}

