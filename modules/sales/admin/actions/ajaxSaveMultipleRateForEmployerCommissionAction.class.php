<?php

require_once __DIR__."/../locales/Forms/SaleEmployerCommissionMultipleForm.class.php";

class sales_ajaxSaveMultipleRateForEmployerCommissionAction extends mfAction {
                 
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
        $this->item = new SaleEmployerCommission($request->getPostParameter('SaleEmployerCommission')); 
        if ($this->item->isNotLoaded())             
            return ;
        //echo "<pre>"; 
      //  var_dump($request->getPostParameter('SaleEmployerCommissionMultipleRate'));
        $this->form=new SaleEmployerCommissionMultipleForm($this->item,$request->getPostParameter('SaleEmployerCommissionMultipleRate'));  
        $this->form->bind($request->getPostParameter('SaleEmployerCommissionMultipleRate')); 
        if ($this->form->isValid())
        {
             $this->item->updateRates($this->form->getRates());
             $messages->addInfo(__("Rates have been updated."));                  
             $this->forward($this->getModuleName(), 'ajaxListPartialEmployerCommission');
        }   
        else
        {
              $messages->addError(__("Form has some errors."));              
          //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }    
    }

}
