<?php

class employees_messagesActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
      
       $this->user=$this->getUser();
       
    } 
    
    
}