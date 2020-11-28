<?php


class CustomerAcademyTeacherUserFormatter extends mfFormatter {
   
    
    
     function getName()
    {
        return $this->getFirstname()->lower()->ucfirst()." ".(string)$this->getLastname()->lower()->ucfirst();   
    }
    
     function getUsername()
    {
        return new mfString($this->getValue()->get('username'));
    }
    
    function getUser()
    {
        return new mfString((string)$this->getValue());
    }
    
    function getLockedAt()
    {        
        return new DateFormatter($this->getValue()->get('locked_at'));        
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
    
     function getBirthday()
    {
        return new DateFormatter($this->getValue()->get('birthday'));
    }
    
    function getPhone()
    {
        return new mfString($this->getValue()->get('phone'));
    }
    
      function getCountry()
    {
        return new CountryFormatter($this->getValue()->get('country'));
    }
    
      function getMobile()
    {
        return new mfString($this->getValue()->get('mobile'));
    } 
    
       function getNumberOfCourses()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_courses'));
    }       
    
  
       function getCity()
    {
        return new mfString(mb_strtolower($this->getValue()->get('city')));
    }
    
    
    function toArrayForEmail()
    {       
        $values=$this->getValue()->toArray();         
        $values['name']=(string)$this->getName();   
        $values['firstname']=(string)$this->getFirstname()->lower()->ucfirst();
        $values['lastname']=(string)$this->getLastname()->lower()->ucfirst();   
        $values['courtesy']=format_courtesy('Dear',$this->getValue()->getGender());        
        $values['gender']=array('full'=>format_gender($this->getValue()->getGender(),1,true,true),
                                'short'=>format_gender($this->getValue()->getGender(),1,false,true)
                               );        
          if ($this->getValue()->hasAvatar())
            $values['avatar']['url']=$this->getValue()->getAvatar()->getUrl();
        $values['clear_password']=$this->getValue()->get('clear_password');
        return $values;  
    }
    
    
     function toArrayForLogin()
    {       
        $values=array();               
        $values['firstname']=(string)$this->getFirstname()->lower()->ucfirst();
        $values['lastname']=(string)$this->getLastname()->lower()->ucfirst();                
        return $values;  
    }
    
}
