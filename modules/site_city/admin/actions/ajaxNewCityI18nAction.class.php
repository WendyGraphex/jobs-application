<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteCityNewForm.class.php";

class site_city_ajaxNewCityI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialCity');  
        }       
        $this->form= new SiteCityNewForm((string)$form['lang'],array());
        $this->item_i18n=new SiteCityI18n(array('lang'=>(string)$form['lang']));        
    }

}
