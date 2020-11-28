<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerFunctionI18nMultipleNewForm.class.php";

class employers_ajaxSaveNewMultipleFunctionI18nAction extends mfAction {
           
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                                             
        try
        {      
            $this->form= new EmployerFunctionI18nMultipleNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployerFunctionI18nMultiple'));   
            $this->form->bind($request->getPostParameter('EmployerFunctionI18nMultiple'));
            if ($this->form->isValid())
            {    
                EmployerFunctionI18n::create($this->form->getValues(),$this->form->getLanguage());
                $messages->addInfo(__("Employer skills has been saved."));
                $request->addRequestParameter('lang',(string)$this->form->getLanguage());
                $this->forward($this->getModuleName(),'ajaxListPartialFunction');
            }   
            else
            {               
                 // var_dump($this->form->getErrorSchema()->getErrorsMessage());               
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}

