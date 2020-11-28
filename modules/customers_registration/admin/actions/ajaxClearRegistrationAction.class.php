<?php


class customers_registration_ajaxClearRegistrationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      
      CustomerRegistration::truncate();    
      $messages->addInfo(__('Registration Database has been cleared.'));
      $this->forward($this->getModuleName(), 'ajaxListPartialRegistration');
    }
}
