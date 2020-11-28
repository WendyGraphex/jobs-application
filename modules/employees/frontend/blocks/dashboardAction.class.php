<?php

class employees_dashboardActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
      
       $this->user=$this->getUser();
       
    } 
    
    
}