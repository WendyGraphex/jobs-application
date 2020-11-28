<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerNotationCriteriaPositionsForm.class.php";

class employers_notation_ajaxPositionsCriteriaAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployerNotationCriteriaPositionsForm($request->getPostParameter('EmployerNotationCriteriaPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerNotationCriteriaPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployerNotationCriteriaPositions'));
        if ($this->form->isValid())
        {           
            EmployerNotationCriteria::updatePositions($this->form->getPositions());
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