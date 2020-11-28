<?php


class employees_notation_AddEmployeeReviewBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
      if (!$this->getUser()->isEmployerUser())                
          return mfView::NONE;     
      $this->employee = EmployeeWork::getEmployeeForEmployerUserAndEmployeeAdvertI18n($this->getUser()->getGuardUser(),$request->getRequestParameter('advert_i18n'));                  
      $employee_advert_i18n_notation = new EmployeeAdvertI18nNotation(array('employee'=>$this->employee,'advert_i18n'=>$request->getRequestParameter('advert_i18n')));
          if ($employee_advert_i18n_notation->isLoaded())
              return mfView::NONE;
       $this->tpl=$this->getParameter('tpl','default');       
    } 
    
    
}
