<?php

require_once __DIR__."/../locales/Forms/EmployerUserNewForm.class.php";

class employers_ajaxNewUserForCompanyAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();
        $this->company=new EmployerCompany($request->getPostParameter('EmployerCompany'));
        if ($this->company->isNotLoaded())
            return ;
        $this->item=new EmployerUser();      
        $this->form= new EmployerUserNewForm($request->getPostParameter('EmployerUser'));                       
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerUser'))
                return ;
        $this->form->bind($request->getPostParameter('EmployerUser'));
        if ($this->form->isvalid())
        {
            $this->item->add($this->form->getValues());
            $this->item->set('company_id',$this->company);
            if ($this->item->isExist()) 
                 throw new mfException (__("Employer user already exists.")); 
            $this->item->save();
            $messages->addInfo(__('Employer User has been created.'));             
            $request->addRequestParameter('company', $this->company);
            $this->forward($this->getModuleName(),'ajaxListPartialUserForCompany');
        }   
        else
        {
         //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__('Form has some errors.'));             
            $this->item->add($request->getPostParameter('EmployerUser'));          
        }             
    }
}
