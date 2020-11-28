<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeGraduateDiplomaPositionsForm.class.php";

class employees_ajaxPositionsGraduateDiplomaAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployeeGraduateDiplomaPositionsForm($request->getPostParameter('EmployeeGraduateDiplomaPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeGraduateDiplomaPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployeeGraduateDiplomaPositions'));
        if ($this->form->isValid())
        {           
            EmployeeGraduateDiploma::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialGraduate');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}