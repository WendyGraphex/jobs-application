<?php

class employers_contact_abuseBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();
       $this->max_characters=500;
       $this->class=$this->getParameter('class');
    } 
    
    
}