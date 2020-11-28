<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerNotationCriteriaI18nMultipleNewForm.class.php";

class employers_notation_ajaxSaveNewMultipleCriteriaI18nAction extends mfAction {
           
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                                             
        try
        {      
            $this->form= new EmployerNotationCriteriaI18nMultipleNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployerNotationCriteriaI18nMultiple'));   
            $this->form->bind($request->getPostParameter('EmployerNotationCriteriaI18nMultiple'));
            if ($this->form->isValid())
            {    
                EmployerNotationCriteriaI18n::create($this->form->getValues(),$this->form->getCategory(),$this->form->getMax(),$this->form->getLanguage());
                $messages->addInfo(__("Employer Notation Categories has been saved."));
                $request->addRequestParameter('lang',(string)$this->form->getLanguage());
                $this->forward($this->getModuleName(),'ajaxListPartialCriteria');
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

