<?php


class employees_notation_rankingsActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                      
      $this->tpl=$this->getParameter('tpl','default');   
      $this->employee_user=$this->getParameter('employee_user');     
      EmployeeAdvertI18nEmployeeCriteriaNotation::loadEmployeeReviews($this->employee_user);     
    } 
    
    
}
