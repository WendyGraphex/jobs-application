<?php


class EmployerCompanyFormatter extends mfFormatter {
   
    function getUser()
    {
        return new mfString((string)$this->getValue());
    }
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
      function getCountry()
    {
        return new CountryFormatter($this->getValue()->get('country'));
    }
    
      function getMobile()
    {
        return new mfString($this->getValue()->get('mobile'));
    } 
    
     function getPhone()
    {
        return new mfString($this->getValue()->get('phone'));
    } 
    
    
    function getName()
    {
         return new mfString($this->getValue()->get('name'));
    }
    
     function getNumberOfAdverts()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_adverts'));
    }
    
    function getNumberOfUsers()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_users'));
    }
    
      function getUrlName()
    {
       return (string)mfString::getInstance($this->getValue()->get('name'))->noaccent()->replace(' ','-')->lower(); 
    }
    
     function getAverageResponseTime()
    {
         return new mfDurationFormatter($this->getValue()->get('average_response_time'),array('choices_hour'=>'[0]no time|[1]one hour|(1,Inf]%s hours'));
    }
    
    function getNumberOfNotations()
    {
        return new mfIntegerFormatter($this->getValue()->get('number_of_notations'),array('around_sign'=>'')); 
    }
    
       function getCity()
    {
        return new mfString(mb_strtolower($this->getValue()->get('city')));
    }
    
    //'number_of_quotations','number_of_views','last_delivery','number_of_works_inprogress','number_of_works'
// 'average_response_time','average_notation','number_of_notations'
    
    
     function toArrayForPdf()
     {
         $values=array();
         foreach (array(           
              'city'=>array('City'=>array('ucfirst')),
              'country'=>array('Country'=>array('getFormatted'))          
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
         foreach (array('address1','address2','name','commercial') as $field)
             $values[$field]=$this->getValue()->get($field);         
         return $values;
     }
}
