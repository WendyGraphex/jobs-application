<?php

 
class sales_quotation_ajaxGetQuoteDialogAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
            $this->forward('employers','ajaxLoginDialog');
        $this->item_i18n=new EmployeeAdvertI18n($request->getPostParameter('EmployeeAdvertI18n'));     
        $this->max_characters=500;
        $this->getUser()->getStorage()->write('advert_i18n',$this->item_i18n);
    }
    
   
}


