<?php

class employees_contact_shareDialogActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();
       $this->max_characters=500;
    } 
    
    
}