<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademyLevelPositionsForm.class.php";

class customers_academy_ajaxPositionsLevelAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new CustomerAcademyLevelPositionsForm($request->getPostParameter('CustomerAcademyLevelPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerAcademyLevelPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('CustomerAcademyLevelPositions'));
        if ($this->form->isValid())
        {           
            CustomerAcademyLevel::updatePositions($this->form->getPositions());
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