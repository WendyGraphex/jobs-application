<?php

require_once __DIR__."/../locales/Forms/EmployeeAdvertI18nMultipleNewForm.class.php";

class employees_ajaxNewAdvertAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
      if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_signin')));
        $messages = mfMessages::getInstance();        
        $this->form = new EmployeeAdvertI18nMultipleNewForm($this->getUser()->getGuardUser(),$request->getPostParameter('EmployeeAdvertMultiple'));        
     //   echo "<pre>"; var_dump($this->advert);
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeAdvertMultiple'))
            return ;
        $this->form->bind($request->getPostParameter('EmployeeAdvertMultiple'));
        if ($this->form->isValid())
        {
           $this->form->getAdvert()->create();           
             
           $engine = new EmployeeAdvertEmailEngine($this->form->getAdvert());
           $engine->sendCreated();
           
           $this->getEventDispather()->notify(new mfEvent($this->form->getAdvert(), 'employee.advert.create')); 
                      
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




