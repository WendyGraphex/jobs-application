<?php


class EmployerUserFormatter extends mfFormatter {
   
    function getName()
    {
        return new mfString((string)$this->getFirstname()->lower()->ucfirst()." ".(string)$this->getLastname()->lower()->ucfirst());   
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
    
     function getNumberOfAdverts()
    {
        return new mfIntegerFormatter($this->getValue()->get('number_of_adverts'),array('choices'=>'[0]no advert|[1]one advert|(1,Inf]%s adverts'));
    }
    
    function getLastDelivery()
    {
         return new DateTimeFormatter($this->getValue()->get('last_delivery'));
    }
    
    function getNumberOfWorksInProgress()
    {
         return new IntegerFormatter($this->getValue()->get('number_of_works_inprogress'));
    }
    
    function getNumberOfWorks()
    {
         return new IntegerFormatter($this->getValue()->get('number_of_works'));
    }
    
      function getAverageResponseTime()
    {
         return new mfDurationFormatter($this->getValue()->get('average_response_time'),array('choices_hour'=>'[0]no time|[1]one hour|(1,Inf]%s hours'));
    }
       
    function getAverageNotation()
    {
        return new mfBargraphFormatter(floatval($this->getValue()->get('average_notation')) / 10,array('format'=>'#.0'));
    }
    
    function getNumberOfNotations()
    {
        return new mfIntegerFormatter($this->getValue()->get('number_of_notations'),array('choices'=>'[0]No review|[1]one review|(1,Inf]%s reviews')); 
    }
         
    
       function getCity()
    {
        return new mfString(mb_strtolower($this->getValue()->get('city')));
    }
    
        function getDefaultLanguage()
    {
        return new LanguageFormatter($this->getValue()->get('default_language'));
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
    
    function toArrayForPdf()
     {
         $values=array();
         foreach (array(           
             'firstname'=>array('Firstname'=>array('ucfirst')),
             'lastname'=>array('Lastname'=>array('ucfirst')),            
         ) as $field => $options)
         {
            $method="get".ucfirst(key($options)); 
            $parameters=current($options);
            $formatter=$parameters[0];
              if ($parameters[1])
                $values[$field]=$this->$method()->$formatter($parameters[1]);
            else
               $values[$field]=$this->$method()->$formatter(); 
         }   
         if ($this->getValue()->hasCompany())
         {    
            $values['company']=$this->getValue()->getCOmpany()->getFormatter()->toArrayForPdf();
         }
         else
         {
            foreach (array('address1','address2') as $field)
             $values[$field]=$this->getValue()->get($field); 
         }    
          foreach (array('email') as $field)
             $values[$field]=$this->getValue()->get($field); 
         return $values;
     }
     
    function getUsernameForEmail()
    {
        return array($this->getValue()->get('email')=>$this->getValue()->get('username'));
    }
    
    
    function getTitle()
    {        
       return new mfString($this->getValue()->get('title'));
    }
    
    function getShortDescription()
    {        
       return new mfString($this->getValue()->get('short_description'));
    }
    
}
