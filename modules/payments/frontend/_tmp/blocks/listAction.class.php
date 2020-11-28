<?php

class payments_listActionComponent extends mfActionComponent {
                   
     
    function execute(mfWebRequest $request) {         
         if (mfcontext::getInstance()->getSite()->getSite()->get('site_type')!='ECOM')
             return mfView::NONE;
         $this->payments=paymentUtils::getListpayments();  
         $this->page_cms_payment=CmsI18nPageUtils::getPageByNameAndLang($this->getParameter('page'),$this->getUser()->getCountry());       
         $this->tpl=$this->getParameter('tpl','default.tpl');   
    }
                    
}    