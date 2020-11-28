<?php


class CustomerMessageFormatter extends mfFormatter {
   
    
     function getCreatedAt()
     {
         return new DateTimeFormatter($this->getValue()->get('created_at'));
     }
     
     
     function getNumberOfFiles()
     {
         return new IntegerFormatter($this->getValue());
     }
    
     
     function toArrayForEmail()
     {
         $values=$this->getValue()->toArray();       
         if ($this->getValue()->isEmployerSender() || $this->getValue()->isEmployeeSender())
            $values['sender']=$this->getValue()->getSender()->get('username');
        else 
            $values['sender']=__('Administrator');
         $values['receiver']=$this->getValue()->getReceiver()->toArray();
         return $values;
     }
}
