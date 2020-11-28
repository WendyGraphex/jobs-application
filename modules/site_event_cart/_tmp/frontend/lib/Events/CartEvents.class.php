<?php


class CartEvents {
    
    
    static function setChangeCurrency(mfEvent $event)
    {                  
         $item=$event->getSubject();  // SIteCurrency
         if (!mfModule::isModuleInstalled('cart'))
             return ;  
         if (!$cart=mfContext::getInstance()->getUser()->getStorage()->read('cart'))
            $cart->set('currency_id',$item)->save();
    }
   
    static function setEmploerUserConnected(mfEvent $event)
    {                  
         $item=$event->getSubject();  // EmployerUser
         if (!mfModule::isModuleInstalled('cart'))
             return ;         
         if ($cart=mfContext::getInstance()->getUser()->getStorage()->read('cart'))
         {                     
            $cart->set('employer_user_id',$item)->save();                       
         }   
    }
    
    
    
}
