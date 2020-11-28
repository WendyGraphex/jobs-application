<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerNotationCategoryI18nMultipleNewForm.class.php";

class employers_notation_ajaxSaveNewMultipleCategoryI18nAction extends mfAction {
           
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                                             
        try
        {      
            $this->form= new EmployerNotationCategoryI18nMultipleNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployerNotationCategoryI18nMultiple'));   
            $this->form->bind($request->getPostParameter('EmployerNotationCategoryI18nMultiple'));
            if ($this->form->isValid())
            {    
                EmployerNotationCategoryI18n::create($this->form->getValues(),$this->form->getLanguage());
                $messages->addInfo(__("Employer Notation Categories has been saved."));
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

