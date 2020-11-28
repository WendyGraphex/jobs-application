<?php

class employees_wantAJobMenuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                         
       $this->user=$this->getUser();
    } 
    
    
}
