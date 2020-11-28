<?php


class SiteEventCart extends SiteEventCartBase {
     
 /*   function getCartQuotations()
    {
         if ($this->cart_quotations===null)          
         {    
            $this->cart_quotations = new CartQuotationCollection();  
            $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('cart_id'=>$this->get('id')))
                  ->setQuery("SELECT * FROM ".CartQuotation::getTable()." WHERE cart_id='{cart_id}' AND status='ACTIVE';")
                  ->makeSqlQuery();                            
            if (!$db->getNumRows())
                return $this->cart_quotations;       
            while ($item= $db->fetchObject('CartQuotation'))
            {
                $this->cart_quotations[]=$item->loaded();  
            }     
            $this->cart_quotations->loaded();
         }
         return $this->cart_quotations;
    }*/
     
    static function create($user,$request)
    {          
        $cart = new self();
        $cart->add(array(
            'ip'=>$request->getIP(),
            'currency_id'=>$user->getStorage()->read('currency',new SiteCurrency('USD')),
            'event_user_id'=>$user->isEventUser()?$user->getGuardUser():null,       
            'culture'=>$user->getCulture(),
            'lang'=>$user->getLanguage(),
            'country'=>$user->getCountry(),
        ));
        $cart->save();
        $cart->setReference();
        $user->getStorage()->write('event_cart',$cart);
        return $cart;
    }      
}
