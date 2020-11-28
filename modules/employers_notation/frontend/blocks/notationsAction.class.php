<?php


class employers_notation_notationsActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                      
      $this->tpl=$this->getParameter('tpl','default');        
      $this->employer_user=$this->getParameter('employer_user');
    } 
    
    
}
