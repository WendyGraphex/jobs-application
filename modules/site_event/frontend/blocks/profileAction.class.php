<?php

class site_event_profileActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {               
       $this->user=$this->getUser()->getGuardUser();        
    } 
    
    
}