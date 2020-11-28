<?php
class cart_ajaxDecQuantityCartProductToMyCartAction extends mfAction {

      function execute(mfWebRequest $request) { 
        $messages = mfMessages::getInstance();   
        try 
        {         
            if (!$cart=$this->getUser()->getStorage()->read('cart'))
               $this->forwardTo401Action();     
            $cart_product=new CartProduct($request->getPostParameter('CartProduct'));
            if ($cart_product->getCart()->get('id') != $cart->get('id'))
                $this->forwardTo401Action();
            $cart_product->subQuantity(1);                        
            $cart->getEngine()->clean()->process();  
            $response=array('action'=>'DecQuantity',
                            'id'=>$cart_product->get('id'),
                            'quantity'=>(string)$cart_product->getFormatter()->getQuantity()
                           ); 
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }    
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
      }

}