<?php

require_once __DIR__."/../locales/Forms/EmployerUserViewForm.class.php";

class employers_ajaxSaveUserForCompanyAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();
        $this->item=new EmployerUser($request->getPostParameter('EmployerUser'));
        $this->form= new EmployerUserViewForm();     
        if ($this->item->isNotLoaded())
            return ;
        $this->form= new EmployerUserViewForm();     
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerUser'))
                return ;
        $this->form->bind($request->getPostParameter('EmployerUser'));
        if ($this->form->isvalid())
        {          
            $this->item->add($this->form->getValues());
            if ($this->item->isExist()) 
                throw new mfException (__("Employer User already exists.")); 
            $this->item->save();
            $messages->addInfo(__('Employer has been updated.'));    
            $request->addRequestParameter('company', $this->item->getCompany());
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
