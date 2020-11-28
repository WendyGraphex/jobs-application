<?php

require_once __DIR__."/../locales/Forms/EmployerCompanyNewForm.class.php";

class employers_ajaxNewCompanyAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
      
        $messages = mfMessages::getInstance(); 
             
        $this->form= new EmployerCompanyNewForm($request->getPostParameter('EmployerCompany'));             
        $this->item=new EmployerCompany();       
            if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerCompany'))
            return ;
            $this->form->bind($request->getPostParameter('EmployerCompany'),$request->getFiles('EmployerCompany'));
           // $this->form->bind($request->getPostParameter('EmployerCompany'));
            if ($this->form->isvalid())
            {
                $this->item->add($this->form->getValues());
                if ($this->item->isExist()) 
                    throw new mfException (__("Company already exists."));
                $this->item->setLogo($this->form->getLogo());
                $this->item->setPictureCompany($this->form->getPictureCompany());
                $this->item->save();
                //$this->item->savePicture();
                $messages->addInfo(__('Company has been created.'));             
                $this->forward('employers','ajaxListPartialCompany');
            }   
            else
            {
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));             
                $this->item->add($this->form->getDefaults());
            }    
            

    }
}
