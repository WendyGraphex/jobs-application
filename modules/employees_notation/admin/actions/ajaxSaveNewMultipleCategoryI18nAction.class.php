<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeNotationCategoryI18nMultipleNewForm.class.php";

class employees_notation_ajaxSaveNewMultipleCategoryI18nAction extends mfAction {
           
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                                             
        try
        {      
            $this->form= new EmployeeNotationCategoryI18nMultipleNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployeeNotationCategoryI18nMultiple'));   
            $this->form->bind($request->getPostParameter('EmployeeNotationCategoryI18nMultiple'));
            if ($this->form->isValid())
            {    
                EmployeeNotationCategoryI18n::create($this->form->getValues(),$this->form->getLanguage());
                $messages->addInfo(__("Employee Notation Categories has been saved."));
                $request->addRequestParameter('lang',(string)$this->form->getLanguage());
                $this->forward($this->getModuleName(),'ajaxListPartialCategory');
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

