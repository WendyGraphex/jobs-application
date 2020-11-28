<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeStudyLevelPositionsForm.class.php";

class employees_ajaxPositionsLevelAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployeeStudyLevelPositionsForm($request->getPostParameter('EmployeeStudyLevelPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeStudyLevelPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployeeStudyLevelPositions'));
        if ($this->form->isValid())
        {           
            EmployeeStudyLevel::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialLevel');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}