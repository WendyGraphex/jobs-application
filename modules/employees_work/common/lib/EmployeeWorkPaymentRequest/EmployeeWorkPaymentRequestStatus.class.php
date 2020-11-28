<?php

class EmployeeWorkPaymentRequestStatus extends mfEnumerationObject {
    
    const DELETED="DELETED",PLANNED="PLANNED",ACTIVE="ACTIVE", INPROGRESS='INPROGRESS', REFUSED='REFUSED',ACCEPTED='ACCEPTED', PAID="PAID"; //,REQUESTED="REQUESTED";
      
    protected static $choices =null; 
        
    function __construct($item) {
        $this->item=$item;
        parent::__construct($item,'status');
    }       
       
     function refused()
    {
        $this->set(self::REFUSED);                
        $this->getItem()->set('refused_at',date("Y-m-d H:i:s"));   
        return $this->save();              
    }
        
     function confirmed()
    {
        $this->set(self::ACCEPTED);      
        $this->getItem()->set('confirmed_at',date("Y-m-d H:i:s"));                
        return $this->save(); 
    }
    
     function planned()
    {
        $this->set(self::PLANNED);      
        $this->getItem()->set('accepted_at',null);   
        $this->getItem()->set('refused_at',null);      
        return $this->save();     
    }
    
    function accepted()
    {
        $this->set(self::ACCEPTED);      
        $this->getItem()->set('accepted_at',date("Y-m-d H:i:s"));   
        $this->getItem()->set('refused_at',null);
        return $this->save();                
    }        
        
    function hasConfirmed()
    {       
        return !$this->getItem()->isConfirmed() && !$this->isAccepted() && ($this->isRefused() || $this->isActive() || $this->getItem()->getRequestedAt()->isOver());
    }              
    
}
