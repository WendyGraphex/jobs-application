<?php

require_once __DIR__ . "/../locales/Forms/employeeMyCompanyForm.class.php";


class employees_ajaxSaveMyCompanyAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_signin')));       
        if (!$this->getUser()->getGuardUser()->isAdmin())
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();   
        $this->item=$this->getUser()->getGuardUser()->getCompany();             
        $this->form= new EmployeeMyCompanyForm();          
        if ($this->item->isNotLoaded())
            return ;      
        $this->form->bind($request->getPostParameter('MyCompany'));
        if ($this->form->isValid()) 
        {
            $this->item->add($this->form->getValues());
            $this->item->save();
            $messages->addInfo(__("Your company has been updated."));
           // $this->forward('suppliers','ajaxListPartialCompany');
            
        } 
        else 
        {
            var_dump($this->form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__("Form has some errors."));
            $this->item->add($this->form->getDefaults());
        }

    }

}


