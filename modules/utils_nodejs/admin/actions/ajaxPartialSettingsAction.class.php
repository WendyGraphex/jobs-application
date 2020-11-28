<?php

require_once __DIR__."/../locales/Forms/UtilsNodeJsForm.class.php";

class utils_nodejs_ajaxPartialSettingsAction extends mfAction {
    
       
    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();                     
        $this->settings= new UtilsNodeJsSettings();    
         $this->form=new UtilsNodeJsForm();                 
        if (!$request->isMethod('POST') || !$request->getPostParameter('Settings'))
           return ;
        $this->form->bind($request->getPostParameter('Settings'));
        if ($this->form->isValid())
        {            
            $this->settings->add($this->form->getValues());                    
            $this->settings->save();
            $messages->addInfo(__("Settings have been saved."));           
        }
        else
        {
          $messages->addError(__("Form has some errors."));
          $this->settings->add($request->getPostParameter('Settings')); // Repopulate                   
        }                
    }
    
}

