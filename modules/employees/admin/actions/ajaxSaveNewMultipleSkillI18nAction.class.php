<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeSkillI18nMultipleNewForm.class.php";

class employees_ajaxSaveNewMultipleSkillI18nAction extends mfAction {
           
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                                             
        try
        {      
            $this->form= new EmployeeSkillI18nMultipleNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployeeSkillI18nMultiple'));   
            $this->form->bind($request->getPostParameter('EmployeeSkillI18nMultiple'));
            if ($this->form->isValid())
            {    
                EmployeeSkillI18n::create($this->form->getValues(),$this->form->getLanguage());
                $messages->addInfo(__("Employee skills has been saved."));
                $request->addRequestParameter('lang',(string)$this->form->getLanguage());
                $this->forward($this->getModuleName(),'ajaxListPartialSkill');
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

