<?php

require_once __DIR__."/../locales/Forms/SystemModelTextNewForm.class.php";

class system_texts_ajaxNewModelI18nAction extends mfAction {
    
        
    
        
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
        $form=new LanguageFrontendForm($this->getUser()->getCountry());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getCountry());
            $this->forward('system_texts_ajax','ajaxListPartialModel');  
        }       
        $this->form= new SystemModelTextNewForm((string)$form['lang'],array());
        $this->item_i18n=new SystemModelTextI18n(array('lang'=>(string)$form['lang']));
        $this->country=$this->getUser()->getCountry();
    }

}
