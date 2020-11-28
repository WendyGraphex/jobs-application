<?php


class PaymentActionsForm extends mfForm {
    
     function configure()
    {
        $this->setValidators(array(
            "action"=>new mfValidatorChoice(array("choices"=>array("MODIFY")))          
        ));        
    }
}