<?php

require_once dirname(__FILE__)."/../locales/Forms/PaymentForm.class.php";
require_once dirname(__FILE__)."/../locales/Forms/PaymentActionsForm.class.php";


class payments_listpaymentsAction extends mfAction {   
         
    function execute(mfWebRequest $request) {           
      if (!$this->getUser()->isAuthenticated())
                $this->redirect(link_i18n_to('customers_authentification'));   // Go to address             
      if (!$cart=$this->getUser()->getStorage()->read('cart'))
           $this->redirect(link_i18n_to('cart_shopping_carts'));                  
      // Step authorized ?
      if (!$orderSteps=$this->getUser()->getStorage()->read('orderSteps'))
          $this->redirect(link_i18n_to('cart_shopping_carts'));       
      $orderSteps->setCurrent($request->getParameter('route'));
     
      if (!$orderSteps->getCurrent()->isAuthorized())
      {                  
          $this->redirect(link_i18n_to($orderSteps->getPreviousAuthorized()->getRoute()));   
      } 
          
    // For debug ======>  
  /*    if (!$cart=$this->getUser()->getStorage()->read('cart'))
      {    
          $cart=new Cart(56);
          $this->getUser()->getStorage()->write('cart',$cart);
          $cart->process();
      } // <====== For debug */
       
      $messages = mfMessages::getInstance();   
      try 
      {           
                $modify=false;
                if ($request->isMethod('POST') && $request->getPostParameter('paymentAction'))
                {              
                   $form=new PaymentActionsForm();
                   $form->bind($request->getPostParameter('paymentAction'));
                   $modify=$form->isValid();  
                }   
                else 
                {
                   $modify=true;             
                }           
                if ($cart->haspayment() && !$modify && !$request->getPostParameter('payment'))
                {                             
                   $payment=$cart->getpayment();
                   $request->addRequestParameter('payment',$payment);                         
                   $this->forward($payment->getModule(),'cartInProgressWithpayment'); 
                }
                if ($request->isMethod('POST') && $request->getPostParameter('payment'))
                {
                    $this->form=new PaymentForm();
                    $this->form->bind($request->getPostParameter('payment'));
                    if ($this->form->isValid())
                    {                                                        
                          $payment=$this->form->getpayment();                           
                          // catch  paymentEngineException ???
                          $payment->loadpaymentEngine($cart); //,$request->getPostParameter($carrier->getName()));                           
                          $payment->getpaymentEngine()->bind($request->getPostParameter($payment->getRequestName()),$this->getUser());
                          if ($payment->getpaymentEngine()->isValid())
                          {                       
                              $cart->set('payment_id',$payment);                                            
                              $cart->setpaymentOptions($payment->getpaymentEngine()->getOptionsValues());
                              $cart->save();     
                              // On calcule le cart 
                              $cart->process();
                              $request->addRequestParameter('payment',$payment);     
                              if ($cart->isEmpty())                              
                              {
                                  $messages->addInfo(__("Your shopping cart is empty."));
                              }
                              else
                              {                                                      
                                $this->forward($payment->getModule(),'cartInProgressWithpayment');
                              }                             
                          }    
                          else 
                          {
                              //echo "payment Not Valid."; //???
                               $messages->addError(__("Payment method is not valid"));
                          }                                                                                    
                    }   
                    else
                    { 
                        // Check if no payment selected
                        if ($this->form['id']->hasError())
                            $messages->addError(__("No payment method selected"));
                        var_dump($this->form->getErrorSchema()->getErrorsMessage());
                    }    
                    
                }     
          
          
          $this->payments=paymentUtils::getListpayments();                    
          $this->payments->getAuthorizedpayments($this->getUser()->getStorage()->read('cart'),$this->getUser()->getCulture());           
          TextI18nLoader::getInstance('paymentTextI18n',$this->getUser()->getCulture());
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }                         
   
    }
 
}

