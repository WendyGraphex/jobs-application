<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleBillingStateNewForm.class.php";

class sales_billing_ajaxNewStateI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward('billings','ajaxListPartialState');  
        }       
        $this->form= new SaleBillingStateNewForm((string)$form['lang'],array());
        $this->item_i18n=new SaleBillingStateI18n(array('lang'=>(string)$form['lang']));        
    }

}
