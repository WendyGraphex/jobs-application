<?php
 
class cart_ajaxDeleteCartProductToMyCartAction extends mfAction {
    
 
      
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {    
           if ($this->getUser()->isAuthenticated() && !$this->getUser()->isCustomerUser())          
                $this->forwardTo401Action();  
           
         // $validator=new mfValidatorInteger();
           $cart= new CartProduct($request->getPostParameter('CartProduct'));
            if($cart==null) 
                return ;
            $cart->delete();
            $response = array("id" =>$cart->get('id'));
          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
