<?php


require_once __DIR__."/../locales/Forms/PartnerWorkCategoryMenuViewForm.class.php";

class partners_ajaxViewCategoryMenuI18nAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();             
        $this->user=$this->getUser();       
        $this->form = new PartnerWorkCategoryMenuViewForm();
        $this->item_i18n=new PartnerWorkCategoryMenuI18n($request->getPostParameter('PartnerWorkCategoryMenuI18n'));         
    }
}
