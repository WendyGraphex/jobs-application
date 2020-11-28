<?php


class employers_notation_AddEmployerReviewBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
      if (!$this->getUser()->isEmployee())                
          return mfView::NONE;                      
      $this->employer = EmployeeWork::getEmployerForEmployeeUserAndEmployerAdvertI18n($this->getUser()->getGuardUser(),$request->getRequestParameter('advert_i18n'));      
      
      $employer_advert_i18n_notation = new EmployerAdvertI18nNotation(array('employer'=>$this->employer,'advert_i18n'=>$request->getRequestParameter('advert_i18n')));
      if ($employer_advert_i18n_notation->isLoaded())
          return mfView::NONE;        
       $this->tpl=$this->getParameter('tpl','default');       
    } 
    
    
}
