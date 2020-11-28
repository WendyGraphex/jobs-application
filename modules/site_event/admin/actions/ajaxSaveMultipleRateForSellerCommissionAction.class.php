<?php

require_once __DIR__."/../locales/Forms/SiteEventSellerCommissionMultipleForm.class.php";

class site_event_ajaxSaveMultipleRateForSellerCommissionAction extends mfAction {
                 
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
        $this->item = new SiteEventSellerCommission($request->getPostParameter('SiteEventSellerCommission')); 
        if ($this->item->isNotLoaded())             
            return ;
        //echo "<pre>"; 
      //  var_dump($request->getPostParameter('SiteEventSellerCommissionMultipleRate'));
        $this->form=new SiteEventSellerCommissionMultipleForm($this->item,$request->getPostParameter('SiteEventSellerCommissionMultipleRate'));  
        $this->form->bind($request->getPostParameter('SiteEventSellerCommissionMultipleRate')); 
        if ($this->form->isValid())
        {
             $this->item->updateRates($this->form->getRates());
             $messages->addInfo(__("Rates have been updated."));                  
             $this->forward($this->getModuleName(), 'ajaxListPartialSellerCommission');
        }   
        else
        {
              $messages->addError(__("Form has some errors."));              
          //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }    
    }

}
