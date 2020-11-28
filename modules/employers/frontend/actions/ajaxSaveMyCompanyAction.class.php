<?php

require_once __DIR__ . "/../locales/Forms/EmployerMyCompanyForm.class.php";


class employers_ajaxSaveMyCompanyAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();    
        if (!$this->getUser()->getGuardUser()->isAdmin())
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();   
        $this->item=$this->getUser()->getGuardUser()->getCompany();             
        $this->form= new EmployerMyCompanyForm($this->getUser()->getGuardUser());          
       // if ($this->item->isNotLoaded())
       //     return ;      
        $this->form->bind($request->getPostParameter('MyCompany'),$request->getFiles('MyCompany'));
        if ($this->form->isValid()) 
        {
            $this->item->add($this->form->getValues());
            $this->item->setPictureFile($this->form->getPicture());
            $this->item->setLogoFile($this->form->getLogo());
            $this->item->save();
            $messages->addInfo(__("Your company has been updated."));
            if ($this->item->isCompleted())
                    $messages->addInfo(__('Your company has been updated and completed.'));         
            else
                    $messages->addInfo(__('Your company has been updated.'));         
           // $this->forward('suppliers','ajaxListPartialCompany');
            
        } 
        else 
        {
          //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__("Form has some errors."));
            $this->item->add($this->form->getDefaults());
        }

    }

}


