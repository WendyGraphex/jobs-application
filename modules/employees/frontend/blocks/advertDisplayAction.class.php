<?php

 

class employees_advertDisplayActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->max_characters=500;
       $this->tpl=$this->getParameter('tpl','default');      
    } 
    
    
}