<?php



class partners_ajaxSelectCategoryAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();                     
        $this->item=new PartnerWorkCategory($request->getPostParameter('PartnerWorkCategoryNode'));         
    }
}

