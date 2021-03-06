<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerFunctionPositionsForm.class.php";

class employers_ajaxPositionsFunctionAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployerFunctionPositionsForm($request->getPostParameter('EmployerFunctionPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerFunctionPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployerFunctionPositions'));
        if ($this->form->isValid())
        {           
            EmployerFunction::updatePositions($this->form->getPositions());
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