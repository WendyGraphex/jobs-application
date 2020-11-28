<?php

require_once __DIR__."/../locales/Forms/SystemModelTextViewForm.class.php";
 
class system_texts_ajaxViewModelI18nAction extends mfAction {
    
    
    
   
        
    function execute(mfWebRequest $request) {                   
        $messages = mfMessages::getInstance();
        $this->form = new SystemModelTextViewForm();
        $this->item=new SystemModelTextI18n($request->getPostParameter('SystemModelTextI18n'));    
        $this->country=$this->getUser()->getCountry();
   }

}

