<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademyTopicPositionsForm.class.php";

class customers_academy_ajaxPositionsTopicForCategoryI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();   
        
                        
        $this->form=new CustomerAcademyTopicPositionsForm($request->getPostParameter('CustomerAcademyTopicPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerAcademyTopicPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('CustomerAcademyTopicPositions'));
        if ($this->form->isValid())
        {           
            CustomerAcademyTopic::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialTopic');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}