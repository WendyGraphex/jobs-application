<?php

require_once __DIR__."/../locales/Forms/EmployeeAdvertI18nMultipleViewForm.class.php";

class employees_ajaxSaveAdvertAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
      if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_signin')));
        $messages = mfMessages::getInstance();   
        $this->advert = new EmployeeAdvert($request->getPostParameter('EmployeeAdvert'),$this->getUser()->getGuardUser());
        if ($this->advert->isNotLoaded())
            return ;
        $this->form = new EmployeeAdvertI18nMultipleViewForm($this->advert,$request->getPostParameter('EmployeeAdvertMultiple'));   
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeAdvertMultiple'))
            return ;
        $this->form->bind($request->getPostParameter('EmployeeAdvertMultiple'));
        if ($this->form->isValid())
        {           
           $this->advert->updateAvertsI18n();
           $messages->addInfo(__('Job has been updated.'));          
           $this->forward($this->getModuleName(), 'ajaxListPartialAdvert');
        }   
        else
        {
          //  echo "KO";
          //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
           $messages->addError(__('Form has some errors.'));
        }         
    }

}




