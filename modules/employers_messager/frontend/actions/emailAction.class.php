<?php

class employers_messager_emailAction extends mfAction {
    

    
    function execute(mfWebRequest $request) {               
        $messages = mfMessages::getInstance();          
        
       // var_dump($this->getParameters());
          $this->company=$this->getParameters()->getCompany()->toArray();  
          $this->model_i18n= $this->getParameters()->getSettings()->getEmployerEmailModel()->getI18n();      
          $this->message= $this->getParameters()->getMessage()->getFormatter()->toArrayForEmail();       
    }
    
   
}


