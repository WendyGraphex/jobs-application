<?php

require_once __DIR__."/../locales/Forms/EmployeeNewForm.class.php";

class employees_ajaxNewEmployeeAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
      
        $messages = mfMessages::getInstance(); 
         //var_dump($request->getPostParameter('Employee'));    
        $this->form= new EmployeeNewForm($this->getUser(),$request->getPostParameter('Employee'));             
        $this->item=new Employee();
        $this->item->add($this->form->getDefaults());
            if (!$request->isMethod('POST') || !$request->getPostParameter('Employee'))
            return ;
            $this->form->bind($request->getPostParameter('Employee'));
            if ($this->form->isvalid())
            {
                $this->item->add($this->form->getValues());
                if ($this->item->isExist()) 
                 throw new mfException (__("Employee already exists.")); 
                $this->item->save();
                $messages->addInfo(__('Employee has been created.'));             
                $this->forward('employees','ajaxListPartialEmployee');
            }   
            else
            {
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));             
                $this->item->add($this->form->getDefaults());
            }    
            

    }
}
