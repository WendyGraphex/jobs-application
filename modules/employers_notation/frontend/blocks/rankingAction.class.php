<?php


class employers_notation_rankingActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                      
      $this->tpl=$this->getParameter('tpl','default');     
      $this->employer_user=$this->getParameter('employer_user');
      
      EmployerAdvertI18nEmployerCriteriaNotation::loadEmployerReviews($this->employer_user);     
    } 
    
    
}
