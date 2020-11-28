<?php

class ProceedToCreditPaymentRequestSelectionForm extends mfForm {
    
    
    function configure() {
        $this->setValidators(array(
            'selection'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selection'))),
        ));
    }
    
    function getSelection()
    {
        return $this->_selection=$this->_selection===null?EmployeeWorkPaymentRequest::getRequestsFromSelection($this['selection']->getArray()):$this->_selection;
    }
}
