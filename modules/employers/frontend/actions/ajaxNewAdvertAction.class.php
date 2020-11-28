<?php

require_once __DIR__."/../locales/Forms/EmployerAdvertI18nMultipleNewForm.class.php";

class employers_ajaxNewAdvertAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_signin')));
        $messages = mfMessages::getInstance();         
        $this->form = new EmployerAdvertI18nMultipleNewForm($this->getUser()->getGuardUser(),$request->getPostParameter('EmployerAdvertMultiple'));             
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerAdvertMultiple'))
            return ;
        $this->form->bind($request->getPostParameter('EmployerAdvertMultiple'));
        if ($this->form->isValid())
        {
           $this->form->getAdvert()->create();           
             
           $engine = new EmployerAdvertEmailEngine($this->form->getAdvert());
           $engine->sendCreated();
           
           $this->getEventDispather()->notify(new mfEvent($this->form->getAdvert(), 'employer.advert.create')); 
           
           $messages->addInfo(__('Job has been created.'));          
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




