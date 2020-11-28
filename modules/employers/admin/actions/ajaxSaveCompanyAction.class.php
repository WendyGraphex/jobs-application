<?php

require_once __DIR__ . "/../locales/Forms/EmployerCompanyViewForm.class.php";


class employers_ajaxSaveCompanyAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        $this->item=new EmployerCompany($request->getPostParameter('EmployerCompany'));
        $this->form = new EmployerCompanyViewForm($request->getPostParameter('EmployerCompany'));      
        $this->form->bind($request->getPostParameter('EmployerCompany'));
        if ($this->form->isValid()) {
            $this->item->add($this->form->getValues());
            $this->item->save();
            $messages->addInfo(__("Company has been updated."));
           $this->forward($this->getModuleName(),'ajaxListPartialCompany');
            
        } else {
            $messages->addError(__("Form has some errors."));
            $this->item->add($this->form->getDefaults());
        }

    }

}


