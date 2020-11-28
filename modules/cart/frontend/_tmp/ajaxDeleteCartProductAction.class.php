<?php


class cart_ajaxDeleteCartProductAction extends mfAction {
    
   function execute(mfWebRequest $request) { 
        $messages = mfMessages::getInstance();   
        try 
        {         
            if ($this->getUser()->isAuthenticated() && !$this->getUser()->isCustomerUser())          
                $this->forwardTo401Action();           
                                     
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }       
       return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
      }
   
}
