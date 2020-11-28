<?php

class EmployeeWorkProcessForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'date'=>new mfValidatorI18nDate(array('required'=>false,'empty_value'=>date("Y-m-d")))
        ));
    }
    
    function getDate()
    {
        return new Day($this['date']->getValue());
    }
}

class employees_work_ajaxProcessWorksAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        
        $form = new EmployeeWorkProcessForm();
        $form->bind($request->getPostParameter('EmployeeWorkProcess'));
        if ($form->isValid())
        {
            $engine= new EmployeeWorkManagerEngine($form->getDate());
            $engine->process();

            $messages->addInfo(__('Payments for works have been processed.'));
        }
        $this->forward($this->getModuleName(), 'ajaxListPartialWork');
    }

}
