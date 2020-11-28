<?php

require_once __DIR__."/../locales/Forms/DeleteProductToCartForm.class.php";

class cart_ajaxDeleteCartProductToCartAction extends mfAction {
    
   function execute(mfWebRequest $request) { 
        $messages = mfMessages::getInstance();   
        try 
        {         
            if ($this->getUser()->isAuthenticated() && !$this->getUser()->isCustomerUser())          
                $this->forwardTo401Action();  
            $form =new DeleteProductToCartForm();
            $form->bind($request->getPostParameter('CartProduct'));
            if ($form->isValid())
            {
                  if (!$cart=$this->getUser()->getStorage()->read('cart'))            
                      return ;               
                  $cart->deleteProduct($form->getCartProduct());               
                  $cart->getEngine()->process();
                  $response = array("id" =>$cart->get('id'));
            }                                  
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }       
        $this->forward($this->getModuleName(),'ajaxSmallCartDisplay');
      } 
   
}
