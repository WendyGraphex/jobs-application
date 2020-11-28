<?php

class CustomerAdminMessageEmailEngine extends CustomerMessageEmailEngine {
    
    
   
    function __construct(CustomerMessage $message) {
        $this->message=$message;
        parent::__construct();
    }
    
     
    
    function send()
    {   
        try 
         {      
                    
       //   var_dump($this->getMessage()->getReceiver()->get('email'));
         // return $this;
         //   $this->getMailer()->debug();          
            $this->getMailer()->sendMail('customers_messager','email',
                        $this->getCompany()->getEmailWithName(),
                        $this->getMessage()->getReceiver()->get('email'), 
                        $this->getMessage()->getSubject(),$this);                            
        } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }                   
        return $this;       
    }
    
}
