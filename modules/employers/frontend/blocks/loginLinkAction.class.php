<?php

class employers_loginLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {          
      $this->user=$this->getUser(); 
      $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}
