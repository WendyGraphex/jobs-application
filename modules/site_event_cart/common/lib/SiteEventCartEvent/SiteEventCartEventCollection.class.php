<?php


class SiteEventCartEventCollection extends mfObjectCollection3 {
     
    protected $cart=null;
    
    function __construct($data=null) {
        if ($data instanceof SiteEventCart)
        {
            $this->cart=$data;
            return parent::__construct();
        }   
        parent::__construct($data);
    }
    
    function getCart()
    {
        return $this->cart;
    }
    
    function init()
    {
        $this->total_sale_price_with_tax=null;
        $this->total_sale_price_without_tax=null;     
        $this->total_quantity=null;
        return $this;
    }
   
   
     function getTotalSalePriceWithTax()
     {
         if ($this->total_sale_price_with_tax===null)
         {
             foreach ($this as $item)
                $this->total_sale_price_with_tax+=$item->getTotalSalePriceWithTax(); 
         }    
         return $this->total_sale_price_with_tax;
     }
     
     function getTotalSalePriceWithoutTax()
     {
        if ($this->total_sale_price_without_tax===null)
        {
             foreach ($this as $item)
                $this->total_sale_price_without_tax+=$item->getTotalSalePriceWithoutTax();  
        }  
        return $this->total_sale_price_without_tax;
     }
     
 
      function deleteEvent(SiteEventCartEvent $cart_event)
     {
        foreach ($this->getKeys() as $index)
        {
            if ($this->getItemByKey($index)->get('id') == $cart_event->get('id'))
               unset($this[$index]);
        }  
        return $this;
     } 
     
     function getAll()
     {            
           if ($this->isLoaded())
             return $this;
           if (!$this->getCart())
               return $this;
            $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('cart_id'=>$this->getCart()->get('id')))
                  ->setQuery("SELECT * FROM ".SiteEventCartEvent::getTable()." WHERE cart_id='{cart_id}';")
                  ->makeSqlQuery();                            
            if (!$db->getNumRows())
                return $this;       
            while ($item= $db->fetchObject('SiteEventCartEvent'))
            {
                $this[$item->get('id')]=$item->loaded();  
            }     
            $this->loaded();
            return $this;
     }
     
     
      function addEvent(SiteEvent $event,$quantity)
    {                  
        if (!$this->hasItemByKey($event->get('id')))
        {    
            $item= new SiteEventCartEvent();
            $item->add(array(
                'event_id'=>$event,                  
                'quantity'=>$quantity,
                'event_user_id'=>$this->getCart()->get('event_user_id'),
                'seller_user_id'=>$event->get('event_user_id'),
                'cart_id'=>$this->getCart()));                  
             $this[$event->get('id')]=$item;    
        }  
        else
        {
             $this[$event->get('id')]->set('quantity',$this[$event->get('id')]->getQuantity() + $quantity);    
        }               
        return $this;
    }
    
    function getTotalQuantity()
    {
        if ($this->total_quantity===null)
        {
            $this->total_quantity=0;
            foreach ($this as $item)
            {
                $this->total_quantity+=$item->getQuantity();
            }    
        }    
        return $this->total_quantity;
    }
}
