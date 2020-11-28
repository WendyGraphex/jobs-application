<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerLevelPositionsForm.class.php";

class employers_ajaxPositionsLevelAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployerLevelPositionsForm($request->getPostParameter('EmployerLevelPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerLevelPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployerLevelPositions'));
        if ($this->form->isValid())
        {           
            EmployerLevel::updatePositions($this->form->getPositions());
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