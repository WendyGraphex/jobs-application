<?php

class customers_registration_registerLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                
      $this->user=$this->getUser(); 
      $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}
