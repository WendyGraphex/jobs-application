<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleQuotationStateNewForm.class.php";

class sales_quotation_ajaxNewStateI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialState');  
        }       
        $this->form= new SaleQuotationStateNewForm((string)$form['lang'],array());
        $this->item_i18n=new SaleQuotationStateI18n(array('lang'=>(string)$form['lang']));        
    }

}
