<?php

class EmployerAdvertI18nAbuseFormatter extends mfFormatter {
           
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
        
    function toArrayForEmail()
    {       
        $values=$this->getValue()->toArray();    
        if ($this->getValue()->hasEmployeeUser())
            $values['employee']=$this->getValue()->getEmployeeUser()->getFormatter()->toArrayForEmail();        
        if ($this->getValue()->hasEmployerUser())
            $values['employer']=$this->getValue()->getEmployerUser()->getFormatter()->toArrayForEmail();
        if ($this->getValue()->hasType())
            $values['type']=(string)$this->getValue()->getType()->getI18n();
        $values['advert_i18n']=$this->getValue()->getAdvertI18n()->getFormatter()->toArrayForEmail();
        return $values;  
    }
}
