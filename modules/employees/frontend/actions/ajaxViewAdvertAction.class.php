<?php

require_once __DIR__."/../locales/Forms/EmployeeAdvertI18nMultipleViewForm.class.php";

class employees_ajaxViewAdvertAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
      if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_signin')));
        $messages = mfMessages::getInstance();   
        $this->advert = new EmployeeAdvert($request->getPostParameter('EmployeeAdvert'),$this->getUser()->getGuardUser());
        $this->form = new EmployeeAdvertI18nMultipleViewForm($this->advert,$request->getPostParameter('EmployeeAdvertMultiple'));                                 
    }

}




