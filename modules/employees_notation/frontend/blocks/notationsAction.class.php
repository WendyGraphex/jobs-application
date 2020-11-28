<?php


class employees_notation_notationsActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                      
      $this->tpl=$this->getParameter('tpl','default');   
      $this->employee_user=$this->getParameter('employee_user');
    } 
    
    
}
