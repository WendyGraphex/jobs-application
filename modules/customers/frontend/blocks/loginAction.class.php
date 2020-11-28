<?php

class customers_loginActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                
      $this->user=$this->getUser();
      $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}
