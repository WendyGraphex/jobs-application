<?php

require_once dirname(__FILE__)."/../locales/Forms/ProjectTaskStateNewForm.class.php";

class projects_ajaxNewTaskStateI18nAction extends mfAction {
    
        
    
        
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getCountry());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getCountry());
            $this->forward('projects','ajaxListPartialTaskState');  
        }       
        $this->form= new ProjectTaskStateNewForm((string)$form['lang'],array());
        $this->item_i18n=new ProjectTaskStateI18n(array('lang'=>(string)$form['lang']));        
    }

}
