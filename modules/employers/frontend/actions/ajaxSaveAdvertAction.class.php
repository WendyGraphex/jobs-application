<?php

require_once __DIR__."/../locales/Forms/EmployerAdvertI18nMultipleViewForm.class.php";

class employers_ajaxSaveAdvertAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
        $messages = mfMessages::getInstance();   
        $this->advert = new EmployerAdvert($request->getPostParameter('EmployerAdvert'),$this->getUser()->getGuardUser());
        if ($this->advert->isNotLoaded())
            return ;
        $this->form = new EmployerAdvertI18nMultipleViewForm($this->advert,$request->getPostParameter('EmployerAdvertMultiple'));   
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerAdvertMultiple'))
            return ;
        $this->form->bind($request->getPostParameter('EmployerAdvertMultiple'));
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




