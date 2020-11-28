<?php

class employees_profileActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
       
       $this->user=$this->getUser()->getGuardUser();
        
    } 
    
    
}