<?php

class ProcessRequestsForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'date'=>new mfValidatorI18nDate(array('date_format'=>'a'))
        ));
    }
    
    function getDate()
    {
        return new DateFormatter($this['date']->getValue());
    }
}

class employees_work_ajaxProcessRequestsAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        
        $form=new ProcessRequestsForm();
        $form->bind($request->getPostParameter('EmployeeProcessRequests'));
        if ($form->isValid())
        {    
         $engine= new EmployeeWorkManagerEngine($form->getDate());
         $engine->process();
                
            $request->addRequestParameter('date', $form->getDate());
        }
        $messages->addInfo(__('Requests have been processed.'));
        $this->forward($this->getModuleName(), 'ajaxListPartialPayment');
    }

}
