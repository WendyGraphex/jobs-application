<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeExperiencePositionsForm.class.php";

class employees_ajaxPositionsExperienceAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployeeExperiencePositionsForm($request->getPostParameter('EmployeeExperiencePositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeExperiencePositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployeeExperiencePositions'));
        if ($this->form->isValid())
        {           
            EmployeeExperience::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialExperience');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}