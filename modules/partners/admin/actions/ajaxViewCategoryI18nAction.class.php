<?php


require_once __DIR__."/../locales/Forms/PartnerWorkCategoryViewForm.class.php";

class partners_ajaxViewCategoryI18nAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();             
        $this->user=$this->getUser();       
        $this->form = new PartnerWorkCategoryViewForm();
        $this->item_i18n=new PartnerWorkCategoryI18n($request->getPostParameter('PartnerWorkCategoryI18n'));         
    }
}
