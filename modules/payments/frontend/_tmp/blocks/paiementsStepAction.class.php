<?php

class payments_paymentsStepActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {                   
        if (!$orderSteps=$this->getUser()->getStorage()->read('orderSteps'))
            return mfView::NONE;
        $this->step=$orderSteps->get('payment');         
    } 
    
    
}
