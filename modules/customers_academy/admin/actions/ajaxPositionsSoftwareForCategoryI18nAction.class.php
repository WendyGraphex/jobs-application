<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademySoftwarePositionsForm.class.php";

class customers_academy_ajaxPositionsSoftwareForCategoryI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();   
        
                        
        $this->form=new CustomerAcademySoftwarePositionsForm($request->getPostParameter('CustomerAcademySoftwarePositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerAcademySoftwarePositions'))
            return ;       
        $this->form->bind($request->getPostParameter('CustomerAcademySoftwarePositions'));
        if ($this->form->isValid())
        {           
            CustomerAcademySoftware::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialSoftware');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}