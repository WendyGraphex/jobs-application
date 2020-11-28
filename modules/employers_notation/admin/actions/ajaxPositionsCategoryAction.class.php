<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerNotationCategoryPositionsForm.class.php";

class employers_notation_ajaxPositionsCategoryAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployerNotationCategoryPositionsForm($request->getPostParameter('EmployerNotationCategoryPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerNotationCategoryPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployerNotationCategoryPositions'));
        if ($this->form->isValid())
        {           
            EmployerNotationCategory::updatePositions($this->form->getPositions());
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