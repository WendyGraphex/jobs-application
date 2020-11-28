<?php


class PaymentMethodFormatter extends mfFormatter {
   
    
    function getName()
    {
        return new mfString($this->getValue()->get('name'));
    }
    
    function getI18n()
    {
        return new mfString(__('payment_'.$this->getValue()->get('name'),array(),'messages',$this->getValue()->get('module')));
    }
            
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
        
    
}

