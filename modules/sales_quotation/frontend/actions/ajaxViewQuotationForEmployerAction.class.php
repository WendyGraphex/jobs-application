<?php

 
class sales_quotation_ajaxViewQuotationForEmployerAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();       
//        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
//            $this->forward('employees','ajaxLoginDialog');
//        $this->item_i18n=new EmployerAdvertI18n($request->getPostParameter('EmployerAdvertI18n'));          
//        $this->max_characters=500;
//        $this->getUser()->getStorage()->write('advert_i18n',$this->item_i18n);
    }
    
   
}


