<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAbuseTypePositionsForm.class.php";

class customers_contact_ajaxPositionsAbuseTypeAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new CustomerAbuseTypePositionsForm($request->getPostParameter('CustomerAbuseTypePositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerAbuseTypePositions'))
            return ;       
        $this->form->bind($request->getPostParameter('CustomerAbuseTypePositions'));
        if ($this->form->isValid())
        {           
            CustomerAbuseType::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialAbuseType');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}