<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademyLevelI18nMultipleNewForm.class.php";

class customers_academy_ajaxSaveNewMultipleLevelI18nAction extends mfAction {
           
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                                             
        try
        {      
            $this->form= new CustomerAcademyLevelI18nMultipleNewForm($this->getUser()->getLanguage(),$request->getPostParameter('CustomerAcademyLevelI18nMultiple'));   
            $this->form->bind($request->getPostParameter('CustomerAcademyLevelI18nMultiple'));
            if ($this->form->isValid())
            {    
                CustomerAcademyLevelI18n::create($this->form->getValues(),$this->form->getLanguage());
                $messages->addInfo(__("Levels have been saved."));
                $request->addRequestParameter('lang',(string)$this->form->getLanguage());
                $this->forward($this->getModuleName(),'ajaxListPartialLevel');
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

