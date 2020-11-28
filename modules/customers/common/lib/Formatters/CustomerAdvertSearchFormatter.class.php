<?php


class CustomerAdvertSearchFormatter extends mfFormatter {
   
    
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
    
     function getLanguage()
     {
          return new LanguageFormatter($this->getValue()->get('language'));
     }
     
     function getCulture()
     {
          return new CultureFormatter($this->getValue()->get('culture'));
     }
    
     function getQuery()
     {
         return new mfString($this->getValue()->get('query'));
     }
     
       function getLocation()
     {
         return new mfString($this->getValue()->get('location'));
     }
    
    function getNumberOfResults()
     {
        return new mfIntegerFormatter($this->getValue()->get('number_of_results'));
     }
     
      function getParametersForUrl()
     {
        $values=array('query'=>(string)$this->getQuery()->urlencode(),
                                      "country"=>$this->getValue()->get('country'),
                                      "city"=>$this->getValue()->get('city'),
                                      'location'=>$this->getValue()->get('location'));  
       if ($this->getValue()->get('type')=='employee')
       {   
           $values["token"]=mfForm::getToken('EmployeeSearchQueryForm');    
       }
       else
       {
           $values["token"]=mfForm::getToken('EmployerSearchQueryForm');
       }    
       return http_build_query($values);
     }
     
     
}
