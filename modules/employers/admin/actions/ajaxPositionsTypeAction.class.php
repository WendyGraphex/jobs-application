<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerContractTypePositionsForm.class.php";

class employers_ajaxPositionsTypeAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployerContractTypePositionsForm($request->getPostParameter('EmployerContractTypePositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerContractTypePositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployerContractTypePositions'));
        if ($this->form->isValid())
        {           
            EmployerContractType::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialType');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}