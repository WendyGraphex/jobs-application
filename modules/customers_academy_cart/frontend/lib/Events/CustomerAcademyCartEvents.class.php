<?php


class CustomerAcademyCartEvents {
    
    
    static function setChangeCurrency(mfEvent $event)
    {                  
         $item=$event->getSubject();  // SIteCurrency
         if (!mfModule::isModuleInstalled('cart'))
             return ;  
         if (!$cart=mfContext::getInstance()->getUser()->getStorage()->read('academy_cart'))
            $cart->set('currency_id',$item)->save();
    }
   
    static function setStudentUserConnected(mfEvent $event)
    {                  
         $item=$event->getSubject();  // EmployerUser
         if (!mfModule::isModuleInstalled('cart'))
             return ;         
         if ($cart=mfContext::getInstance()->getUser()->getStorage()->read('academy_cart'))
         {                     
            $cart->set('student_user_id',$item)->save();                       
         }   
    }
    
    
    
}
