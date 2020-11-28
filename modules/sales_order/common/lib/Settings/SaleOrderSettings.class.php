<?php

class SaleOrderSettings extends SiteSettings {
        
    
     function getDefaults()
    {
        parent::getDefaults();         
        $this->add(array( 
              'order_format_reference'=>'O-{id}',
              'order_format_number'=>'0000',
              "order_model"=>null,
              "order_admin_recipients"=>null,
              "order_employer_cancelled_model"=>null,
              "order_employee_cancelled_model"=>null
        ));        
    }
  function hasSaleOrderModel()
    {
        return (boolean)$this->get('order_model');
    }
      
    function getSaleOrderModel()
    {
        return $this->order_model=$this->order_model===null?new SystemModelText($this->get('order_model')):$this->order_model;
    }
    
    
    function getAdminRecipients()
     {
         if ($this->hasAdminRecipients())
            return $this->get("order_admin_recipients");
         return new mfArray();
     }
     
      function hasAdminRecipients()
    {
        return (boolean)$this->get('order_admin_recipients');
    }  
    
    function getOrderCancelledEmployerEmailModel()
    {
        return  new SystemModelText($this->get('order_employer_cancelled_model','order_employer_cancelled_model'));
    }
    
     function getOrderCancelledEmployeeEmailModel()
    {
         return  new SystemModelText($this->get('order_employee_cancelled_model','order_employee_cancelled_model'));
    }
    
    
    
}
