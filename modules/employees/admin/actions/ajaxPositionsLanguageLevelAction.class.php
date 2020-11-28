<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeLanguageLevelPositionsForm.class.php";

class employees_ajaxPositionsLanguageLevelAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployeeLanguageLevelPositionsForm($request->getPostParameter('EmployeeLanguageLevelPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeLanguageLevelPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployeeLanguageLevelPositions'));
        if ($this->form->isValid())
        {           
            EmployeeLanguageLevel::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialLanguageLevel');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}