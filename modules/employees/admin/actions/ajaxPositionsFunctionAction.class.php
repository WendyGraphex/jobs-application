<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeFunctionPositionsForm.class.php";

class employees_ajaxPositionsFunctionAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployeeFunctionPositionsForm($request->getPostParameter('EmployeeFunctionPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeFunctionPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployeeFunctionPositions'));
        if ($this->form->isValid())
        {           
            EmployeeFunction::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialFunction');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}