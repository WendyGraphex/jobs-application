<?php


class employers_notation_rankingsActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                      
      $this->tpl=$this->getParameter('tpl','default');     
      $this->employer_user=$this->getParameter('employer_user');
      EmployerAdvertI18nEmployerCriteriaNotation::loadEmployerReviews($this->employer_user);     
      // echo "<pre>"; var_dump($this->employer_user->getNotations());
    } 
    
    
}
