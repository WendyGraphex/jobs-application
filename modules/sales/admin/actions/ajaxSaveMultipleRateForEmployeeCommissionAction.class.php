<?php

require_once __DIR__."/../locales/Forms/SaleEmployeeCommissionMultipleForm.class.php";

class sales_ajaxSaveMultipleRateForEmployeeCommissionAction extends mfAction {
                 
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
        $this->item = new SaleEmployeeCommission($request->getPostParameter('SaleEmployeeCommission')); 
        if ($this->item->isNotLoaded())             
            return ;
        //echo "<pre>"; 
      //  var_dump($request->getPostParameter('SaleEmployeeCommissionMultipleRate'));
        $this->form=new SaleEmployeeCommissionMultipleForm($this->item,$request->getPostParameter('SaleEmployeeCommissionMultipleRate'));  
        $this->form->bind($request->getPostParameter('SaleEmployeeCommissionMultipleRate')); 
        if ($this->form->isValid())
        {
             $this->item->updateRates($this->form->getRates());
             $messages->addInfo(__("Rates have been updated."));                  
             $this->forward($this->getModuleName(), 'ajaxListPartialEmployeeCommission');
        }   
        else
        {
              $messages->addError(__("Form has some errors."));              
          //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }    
    }

}
