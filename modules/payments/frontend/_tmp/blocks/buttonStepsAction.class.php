<?php

class payments_buttonStepsActionComponent extends mfActionComponent {

     
    function execute(mfWebRequest $request)
    {     
        $this->nextEnable=$this->getParameter('nextEnable',true);
        $this->previousEnable=$this->getParameter('previousEnable',true); 
        $this->nextAuthorized=$this->getParameter('nextAuthorized',false);
        $this->previousAuthorized=$this->getParameter('previousAuthorized',false);              
        $this->paymentSteps=$this->getUser()->getStorage()->read('paymentSteps');      
    } 
    
    
}

