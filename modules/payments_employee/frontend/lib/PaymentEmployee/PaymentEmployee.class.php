<?php

class PaymentEmployee extends PaymentEmployeeBase {
    
    
       function __construct($parameters = null,$user=null) {        
        if ($user instanceof Employee)
            $this->set('employee_user_id',$user);
        $this->getDefaults();
         if (is_numeric($parameters) && $user instanceof Employee)      
            return $this->loadByIdAndEmployee($parameters,$user);   
        if ($parameters instanceof EmployeeWorkPaymentRequestCollection && $user instanceof Employee)
             $this->loadByRequestsAndEmployer($parameters,$user);   
         if ($user) return ;
        parent::__construct($parameters);
    }
    
    function loadByRequestsAndEmployer(EmployeeWorkPaymentRequestCollection $requests,EmployerUser $user)
    {              
       $this->set('requests',$requests);    
       $this->set('employee_user_id',$user);
    }
    
     function loadByIdAndEmployee($id,Employee $user)
    {       
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employee_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                      " WHERE  ".self::getTableField('employee_user_id')."='{employee_user_id}' AND  id ='{id}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    function create()
    {
        if (!$this->get('requests') || !$this->get('employee_user_id'))
            return $this;
        $this->set('ip', mfContext::getInstance()->getRequest()->getIP());
        $this->set('currency_id',$this->getSettings()->getCurrency()); 
        $this->set('currency',(string)$this->getSettings()->getCurrency()); //mfContext::getInstance()->getUser()->getStorage()->read('currency',new SiteCurrency('USD')));
        $this->getEngine()->process();
        $this->save();
        foreach ($this->getRequests() as $request)        
            $request->set('payment_id',$this);
        $this->getRequests()->save(); 
        $this->set('number_of_requests',$this->getRequests()->count());
        $this->setReference();
        $this->save();
        return $this;
    }
    
    function updating(EmployeeWorkPaymentRequestCollection $selection)
    {      
        if (!$this->get('requests') || !$this->get('employee_user_id'))
             return $this;      
         $this->requests=new EmployeeWorkPaymentRequestCollection();
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array('payment_id'=>$this->get('id')))         
           ->setQuery("UPDATE ".EmployeeWorkPaymentRequest::getTable().       
                      " SET payment_id = NULL".
                      " WHERE payment_id ='{payment_id}' AND id NOT IN('".$selection->getKeys()->implode("','")."')".                                                   
                      ";")
           ->makeSqlQuery(); 
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('payment_id'=>$this->get('id')))         
           ->setQuery("SELECT * FROM ".EmployeeWorkPaymentRequest::getTable().                           
                      " WHERE payment_id ='{payment_id}' AND id IN('".$selection->getKeys()->implode("','")."')".                                                   
                      ";")
           ->makeSqlQuery(); 
         if ($db->getNumRows())
         {
            while ($item=$db->fetchObject('EmployeeWorkPaymentRequest'))                                  
                $this->requests[$item->get('id')]=$item->loaded();  
            $this->requests->loaded();
         }
         
         foreach ($selection as $request)
         {
              if (isset($this->requests[$request->get('id')]))
                  continue;              
              $request->set('payment_id',$this);
              $this->requests[]=$request;
         }    
        $this->requests->save();     
        $this->set('number_of_requests',$this->getRequests()->count());
        $this->getEngine()->process();
        $this->save(); 
        return $this;
    }
}