<?php



class cart_ajaxSubCartProductAction extends mfAction {
    
   function execute(mfWebRequest $request) { 
        $messages = mfMessages::getInstance();   
        try 
        {         
            if ($this->getUser()->isAuthenticated() && !$this->getUser()->isCustomerUser())          
                $this->forwardTo401Action();
            $response = array("action"=>"SubCartProduct");      
                           
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }    
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
      }
   
}
