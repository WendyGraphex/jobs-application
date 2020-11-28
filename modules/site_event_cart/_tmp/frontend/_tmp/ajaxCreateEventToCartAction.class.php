<?php

require_once __DIR__."/../locales/Forms/CartEventCreateForm.class.php";

class cart_ajaxCreateEventToCartAction extends mfAction {
    
   function execute(mfWebRequest $request) { 
        $messages = mfMessages::getInstance();   
        try 
        {         
            if (!$cart=$this->getUser()->getStorage()->read('cart'))   
                 $this->forwardTo401Action ();
            $response = array("action"=>"CartEventCreate");   
            $form =new CartEventCreateForm();
            $form->bind($request->getPostParameter('CartEventCreateToCart'));
            if ($form->isValid())
            {
                $cart->getEvent()->add($form->getValues())->save();
                $cart->set('event_id',$cart->getEvent())->save();
                
                $response['event']=true;
                $response['in_at']=$cart->getEvent()->getFormatter()->getInAt()->getText();
                $response['out_at']=$cart->getEvent()->getFormatter()->getOutAt()->getText();
                $response['b_in_at']=$cart->getEvent()->getFormatter()->getInAt()->getDate();
                $response['b_out_at']=$cart->getEvent()->getFormatter()->getOutAt()->getDate();
            }
            else
            {
               $response['errors']=$form->getErrorSchema()->getErrorsMessage();
            }                                                               
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }    
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
      }
   
}

