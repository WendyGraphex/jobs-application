<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeNotationCriteriaPositionsForm.class.php";

class employees_notation_ajaxPositionsCriteriaAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployeeNotationCriteriaPositionsForm($request->getPostParameter('EmployeeNotationCriteriaPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeNotationCriteriaPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployeeNotationCriteriaPositions'));
        if ($this->form->isValid())
        {           
            EmployeeNotationCriteria::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialCriteria');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}