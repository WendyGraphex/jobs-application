<?php


class EmployerQuotationRequestFormatter extends mfFormatter {
   
  
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getNumberOfProjects()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_projects'));
    }
    
    function getNumberOfQuotations()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_quotations'));
    }
    
     function getQuotedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('quoted_at'));
    }
    
    function getDescription()
    {
        return new mfString($this->getValue()->get('description'));
    }
    
     function getAdvertTitle()
    {                      
             return __('Ref.')." ".$this->getValue()->getAdvert()->getI18n()->get('reference')." ".
                    (string)$this->getValue()->getAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst();                
    }
    
      function toArrayForEmail()
    {       
        $values=$this->getValue()->toArray();         
        $values['employer']= $this->getValue()->getEmployerUser()->getFormatter()->toArrayForEmail();
        $values['employee']= $this->getValue()->getEmployeeUser()->getFormatter()->toArrayForEmail();
        return $values;  
    }
}


