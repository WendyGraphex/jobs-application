<?php


require_once __DIR__."/../locales/Forms/AddQuotationToCartForm.class.php";   

class cart_ajaxAddQuotationToCartAction extends mfAction {
    
   function execute(mfWebRequest $request) { 
        $messages = mfMessages::getInstance();   
        try 
        {         
            if ($this->getUser()->isAuthenticated() && !$this->getUser()->isEmployerUser())          
                $this->forwardTo401Action();
            $response = array("action"=>"AddQuotationToCart");      
            $form =new AddQuotationToCartForm($this->getUser()->getGuardUser());
            $form->bind($request->getPostParameter('AddQuotationToCart'));
            if ($form->isValid())
            {
              // $this->getUser()->getStorage()->remove('cart'); // debug
                  
                if (!$cart=$this->getUser()->getStorage()->read('cart'))                    
                      $cart = Cart::create($this->getUser(),$request);                  
                  $cart->addQuotation($form->getCartQuotation());
                  $cart->getEngine()->process();                   
                 $form->getQuotation()->setInCart()->save();
                  
                  $response['number_of_quotations']=$cart->getCartQuotations()->count();
                  $response['id']=$form->getQuotation()->get('id');
                  $response['state_text']=__('In cart');
                 //var_dump($response['number_of_items']);
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

