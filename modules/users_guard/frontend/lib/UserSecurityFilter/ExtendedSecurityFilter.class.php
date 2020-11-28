<?php

class ExtendedSecurityFilter extends mfBasicSecurityFilter
{
    public function execute($filterChain) {
        
             
       if (!$this->context->getUser()->isAuthenticated()) {         
           $this->forwardTo401Action();
       }
       // check if User Is authorized to this action
       $class=$this->getClassUser();      
       if ($class && !in_array($this->context->getUser()->getClassUser(),(array)$class))
       {
           $this->forwardTo401Action();
       }    
     //  var_dump($this->context->getUser()->getGuardUser(),$this->getClassUser());
       $filterChain->execute();        
    }
  
    protected function getClassUser() {
        return $this->context->getController()->getActionStack()->getLastEntry()->getActionInstance()->getSecurityValue('ClassUser');
    }
    
    protected function isMobileUser()
    {
       return $this->context->getController()->getActionStack()->getLastEntry()->getActionInstance()->getSecurityValue('mobile'); 
    }        
   
}
