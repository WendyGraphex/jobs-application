<?php

class SiteEventOrderSettings extends SiteSettings {
        
    
     function getDefaults()
    {
        parent::getDefaults();         
        $this->add(array( 
              'site_event_order_format_reference'=>'O-{id}',
              'site_event_order_format_number'=>'0000',
              "site_event_order_model"=>null,
              "site_event_order_cancelled_model"=>null,
              "site_event_order_admin_recipients"=>null,
        ));        
    }
  function hasOrderModel()
    {
        return (boolean)$this->get('site_event_order_model');
    }
      
    function getOrderModel()
    {
        return $this->order_model=$this->order_model===null?new SystemModelText($this->get('site_event_order_model')):$this->order_model;
    }
    
     function getAdminRecipients()
     {
         if ($this->hasAdminRecipients())
            return $this->get("site_event_order_admin_recipients");
         return new mfArray();
     }
     
      function hasAdminRecipients()
    {
        return (boolean)$this->get('site_event_order_admin_recipients');
    }  
    
    function getOrderCancelledEmailModel()
    {
        return  new SystemModelText($this->get('site_event_order_cancelled_model','site_event_order_cancelled_model'));
    }
    
     
    
}
