<?php

require_once __DIR__."/../locales/Forms/EmployerUserNewForm.class.php";

class employers_ajaxNewEmployerAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
      
        $messages = mfMessages::getInstance(); 
            // var_dump($request->getPostParameter('Employer'));
        $this->form= new EmployerUserNewForm($this->getUser(),$request->getPostParameter('Employer'));             
        $this->item=new EmployerUser();
        $this->item->add($this->form->getDefaults());
            if (!$request->isMethod('POST') || !$request->getPostParameter('Employer'))
            return ;
            $this->form->bind($request->getPostParameter('Employer'),$request->getFiles('Employer'));
            if ($this->form->isvalid())
            {
                $this->item->add($this->form->getValues());
                if ($this->item->isExist()) 
                            throw new mfException (__("Employer already exists.")); 
                $this->item->setAvatar($this->form->getAvatar());
                //$this->item->save();
                $this->item->save();
                $messages->addInfo(__('Employer has been created.'));             
                $this->forward('employers','ajaxListPartialEmployer');
            }   
            else
            {
                var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));             
                $this->item->add($this->form->getDefaults());
            }    
            

    }
}