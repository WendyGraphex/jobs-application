<?php


class EmployerAdvertI18nFormatter extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getPublishedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('published_at'));
    }
    
     function getLanguage()
    {
        return new LanguageFormatter($this->getValue()->get('lang'));
    } 
    
      function getRefusedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('refused_at'));
    }
    
      function getRevivalAt()
    {
        return new DateTimeFormatter($this->getValue()->get('revival_at'));
    }
    
    function getRevivalIteration() 
    {
         return new IntegerFormatter($this->getValue()->get('revival_iteration'));
    }
    
     function getReference()
    {
        return new mfString($this->getValue()->get('reference'));
    }
    
    function getTitle()
    {
        return new mfString($this->getValue()->get('title'));
    }
    
    function getShortDescription()
    {
        return new mfString($this->getValue()->get('short_description'));
    }
    
    function getDescription()
    {
        return new mfString($this->getValue()->get('description'));
    }
    
    function getContent()
    {
        return new mfString($this->getValue()->get('content'));
    }
    
    function getNumberOfViews() 
    {
         return new IntegerFormatter($this->getValue()->get('number_of_views'));
    }
    
    function getNumberOfQuotations()
    {
          return new IntegerFormatter($this->getValue()->get('number_of_quotations'));
    }
    
      function toArrayForEmail()
    {       
        $values=$this->getValue()->toArray();         
        $values['employer']= $this->getValue()->getAdvert()->getEmployerUser()->getFormatter()->toArrayForEmail();
        $values['url']=$this->getValue()->getUrl();
        return $values;  
    }
}
