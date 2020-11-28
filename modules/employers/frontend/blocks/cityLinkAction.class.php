<?php

 

class employers_cityLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                      
         $this->tpl=$this->getParameter('tpl','default');
         $this->city=$this->getParameter('city');
         $this->country=$this->getParameter('country');
    } 
    
    
}



