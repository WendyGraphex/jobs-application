<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerBudgetUnitPositionsForm.class.php";

class employers_ajaxPositionsUnitAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployerBudgetUnitPositionsForm($request->getPostParameter('EmployerBudgetUnitPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerBudgetUnitPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployerBudgetUnitPositions'));
        if ($this->form->isValid())
        {           
            EmployerBudgetUnit::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialUnit');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}