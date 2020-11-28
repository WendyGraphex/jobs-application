<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerClaimTypeNewForm.class.php";

class customers_ajaxNewTypeI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward('customers','ajaxListPartialType');  
        }       
        $this->form= new CustomerClaimTypeNewForm((string)$form['lang'],array());
        $this->item_i18n=new CustomerClaimTypeI18n(array('lang'=>(string)$form['lang']));        
    }

}
