<?php

class customers_academy_teacher_loginLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                
      $this->user=$this->getUser(); 
      $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}
