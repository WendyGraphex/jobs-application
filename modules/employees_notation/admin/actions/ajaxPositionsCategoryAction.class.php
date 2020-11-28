<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeNotationCategoryPositionsForm.class.php";

class employees_notation_ajaxPositionsCategoryAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployeeNotationCategoryPositionsForm($request->getPostParameter('EmployeeNotationCategoryPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeNotationCategoryPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployeeNotationCategoryPositions'));
        if ($this->form->isValid())
        {           
            EmployeeNotationCategory::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialCategory');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}