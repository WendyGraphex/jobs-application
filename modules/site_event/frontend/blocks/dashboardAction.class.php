<?php

class site_event_dashboardActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
      
       $this->user=$this->getUser();
       
    } 
    
    
}