<?php

require_once __DIR__."/../locales/Forms/EmployerAdvertPopularNewForm.class.php";

class employers_ajaxNewPopularAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
      
        $messages = mfMessages::getInstance(); 
            // var_dump($request->getPostParameter('Employer'));
        $this->form= new EmployerAdvertPopularNewForm($this->getUser(),$request->getPostParameter('EmployerAdvertPopular'));             
        $this->item=new EmployerAdvertPopular();
        $this->item->add($this->form->getDefaults());
            if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerAdvertPopular'))
            return ;
            $this->form->bind($request->getPostParameter('EmployerAdvertPopular'));
            if ($this->form->isvalid())
            {
                $this->item->add($this->form->getValues());
                if ($this->item->isExist()) 
                            throw new mfException (__("Popular already exists.")); 
                //$this->item->setAvatar($this->form->getAvatar());
                $this->item->save();
                $messages->addInfo(__('Popular has been created.'));             
                $this->forward('employers','ajaxListPartialPopular');
            }   
            else
            {
                var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));             
                $this->item->add($this->form->getDefaults());
            }    
            

    }
}