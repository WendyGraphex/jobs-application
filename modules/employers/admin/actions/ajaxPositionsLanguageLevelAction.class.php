<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerLanguageLevelPositionsForm.class.php";

class employers_ajaxPositionsLanguageLevelAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployerLanguageLevelPositionsForm($request->getPostParameter('EmployerLanguageLevelPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerLanguageLevelPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployerLanguageLevelPositions'));
        if ($this->form->isValid())
        {           
            EmployerLanguageLevel::updatePositions($this->form->getPositions());
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