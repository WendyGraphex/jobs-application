<?php


class EmployerAlertFormatter extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getText()
    {
         if ($this->getValue()->hasEmployeeUser())
            return $this->getValue()->getEmployeeUser()->getFormatter()->getUsername();
         if ($this->getValue()->hasEmployerUser())
             return  $this->getValue()->getEmployerUser()->getFormatter()->getUsername();
         if ($this->getValue()->hasEmployeeAdvert())
            return $this->getValue()->getEmployeeAdvertI18n()->getFormatter()->getTitle()->ucfirst();            
         if ($this->getValue()->hasEmployerAdvert())
            return $this->getValue()->getEmployerAdvertI18n()->getFormatter()->getTitle()->ucfirst();
         return "";
    }
     
    
     function toArrayForEmail()
    {       
        $values=$this->getValue()->toArray();     
        if ($this->getValue()->hasEmployeeUser())
            $values['employee']= $this->getValue()->getEmployeeUser()->getFormatter()->toArrayForEmail();
        if ($this->getValue()->hasEmployerUser())
            $values['employer']= $this->getValue()->getEmployerUser()->getFormatter()->toArrayForEmail();
        if ($this->getValue()->hasEmployeeAdvert())
        $values['advert_employee']=$this->getValue()->getEmployerAdvertI18n()->getFormatter()->toArrayForEmail();
        if ($this->getValue()->hasEmployerAdvert())
            $values['advert_employer']=$this->getValue()->getEmployerAdvertI18n()->getFormatter()->toArrayForEmail();
        return $values;  
    }
}
