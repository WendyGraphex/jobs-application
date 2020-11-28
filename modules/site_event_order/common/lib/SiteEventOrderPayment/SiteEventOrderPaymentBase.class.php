<?php
   
class SiteEventOrderPaymentBase extends mfObject3 {
   
            //  `status` ENUM('ACTIVE','DELETED','PAID')
    
     protected static $fields=array('reference','date',
                                    'sale_price_with_tax','sale_price_without_tax',
                                    'total_sale_price_without_tax','total_sale_price_with_tax','quantity',
                                   'order_id','event_user_id','event_id', 'payment_id', 'order_event_id',
                                   'status','created_at','updated_at');
    protected static $fieldsNull=array('updated_at','date','event_user_id','payment_id');        
    const table="t_site_event_order_payment"; 
    protected static $foreignKeys=array('event_user_id'=>'SiteEventUser',                                      
                                        'event_id'=>'SiteEvent',
                                         'order_id'=>'SiteEventOrder',
                                         'payment_id'=>'PaymentCreditEventUser',  
                                         'order_event_id'=>'SiteEventOrderEvent'
                                        );  
    

    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);                    
          return $this->add($parameters); 
      }
      else
        {   
          if ($parameters instanceof SiteEventOrderEvent)
               return $this->loadbyOrderEvent($parameters);         
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);         
        } 
    }   
    
    
    protected function loadByOrderEvent(SiteEventOrderEvent $event_order_event)
    {
        $this->set('order_event_id',$event_order_event);
    }  
     
       protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),      
            'status'=>'ACTIVE',
            'date'=>date("Y-m-d H:i:s"),     
        ));      
    }
            
      function getValuesForUpdate()
      {
          $this->set('updated_at',date("Y-m-d H:i:s"));   
      }   
            
    /*  protected function executeIsExistQuery($db)    
      {
         $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
        $db->setParameters(array('email'=>$this->get('email'),$this->getKey()))
           ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE email='{email}' ".$key_condition)
           ->makeSqlQuery();  
       
      }*/
          
   /*public function getOrder()
    {      
        return $this->_order_id=$this->_order_id===null?new SaleOrder($this->get('order_id')):$this->_order_id;
    }
    */
     function getEventUser()
    {
        return $this->_event_user_id=$this->_event_user_id===null?new SiteEventUser($this->get('event_user_id')):$this->_event_user_id;
    }
    
     function getEvent()
    {
        return $this->_event_id=$this->_event_id===null?new SiteEvent($this->get('event_id')):$this->_event_id;
    }
    
      function getEventOrderEvent()
    {
        return $this->_order_event_id=$this->_order_event_id===null?new SiteEventOrderEvent($this->get('order_event_id')):$this->_order_event_id;
    }
         
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new SiteEventOrderPaymentFormatter($this):$this->formatter;
   }
     
     function getSettings()
    {
        return $this->settings=$this->settings===null?new SiteEventOrderSettings():$this->settings;
    }
    
     
     
    function setReference()
    {        
        $format_reference=$this->getSettings()->get('site_event_order_payment_reference_format','PW{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),
                          '{month}'=>date("m"),
                          '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('site_event_order_payment_format_number','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }   
   
      
     function getTotalPriceWithTax()
    {
        return floatval($this->get('total_price_with_tax')); 
    }
    
     function getTotalPriceWithoutTax()
    {
        return floatval($this->get('total_price_without_tax')); 
    }
    
    
    function getDate()
    {
        return $this->_date= $this->_date===null?new Day($this->get('date')):$this->_date;
    }
    
    
    function transfer()
    {
        if ($this->getEventOrderEvent()->isNotLoaded())
            return $this;
        foreach (array( 'order_id',
                        'id'=>'order_event_id',
                        'event_id',
                        'seller_user_id'=>'event_user_id',  
                        'sale_price_with_tax',
                        'sale_price_without_tax',
                        'total_sale_price_with_tax',
                        'total_sale_price_without_tax',
                        'quantity') as $key=>$field)
        {
           $this->set($field,$this->getEventOrderEvent()->get(is_numeric($key)?$field:$key)); 
        }            
        return $this;
    }
       
  
  /*  function setTotalPriceWithTax($amount)
    {
        $this->set('previous_total_price_with_tax',$this->get('total_price_with_tax'));       
        if ($amount > $this->getTotalPriceWithTax())
        {
            // Remove all planned excepted this
             $db=mfSiteDatabase::getInstance()
                ->setParameters(array('work_id'=>$this->getWork()->get('id'),'id'=>$this->get('id')))
                ->setQuery("DELETE FROM ".EmployeeWorkPaymentRequest::getTable().
                          " WHERE work_id='{work_id}' AND status IN('ACTIVE','PLANNED') AND id !='{id}'".                    
                          ";")
                ->makeSqlQuery();                           
        }    
        $this->set('total_price_with_tax',$amount);       
        return $this;
    }*/
    
    
   /* static function getRequestsFromSelection(mfArray $selection)
    {
         $list = new EmployeeWorkPaymentRequestCollection();
         if ($selection->isEmpty())
             return $list;
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT * FROM ".self::getTable().
                       " WHERE id IN('".$selection->implode("','")."');")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return $list;       
         while ($item=$db->fetchObject('EmployeeWorkPaymentRequest'))
         {
            $list[$item->get('id')] =$item->loaded();
         }
         return $list->loaded();
    }*/
    
    
  /*  function process()
    {        
        $this->getWork()->updateTotalRequired()->save();
        return $this;
    }
    
    function delete()
    {
        $this->set('status','DELETED')->save();
        $this->getWork()->set('is_completed','NO');
        $this->getWork()->updateTotalRequired()->save();
         
        return $this;
    }
    
     function remove()
    {
        parent::delete();
        $this->getWork()->updateTotalRequired()->save();         
        return $this;
    }*/
    
 /*   function getRestOfTotalPriceWithTax()
    {
        if ($this->rest_total_price_with_tax===null)
        {    
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array('work_id'=>$this->get('work_id'),'id'=>$this->get('id')))
           ->setQuery("SELECT SUM(total_price_without_tax) as total_price_without_tax,SUM(total_price_with_tax) as  total_price_with_tax FROM ".EmployeeWorkPaymentRequest::getTable().
                     " WHERE work_id='{work_id}' AND status NOT IN('PAID','ACCEPTED')".                 
                     ";")
           ->makeSqlQuery(); 
         $row=$db->fetchArray();                 
      
         $this->rest_total_price_with_tax= floatval($row['total_price_with_tax']);      
        }
        return $this->rest_total_price_with_tax;

    }*/
    
    /*
     *  'employee_user_id','employer_user_id','quotation_id',  'project_id',
                                    'state_id','state','order_id',
                                    'total_price_without_tax','total_price_with_tax',
                                    'total_paid_without_tax','total_paid_with_tax',
                                    'total_unpaid_without_tax','total_unpaid_with_tax',
                                    'total_required_without_tax','total_required_with_tax','is_completed',
                                    'number_of_payments','number_of_hours','iteration',    'batch' ,       
     */
  /*   static function deleteAll()
    {
       $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("DELETE FROM ".self::getTable().";")               
                ->makeSqlQuery();   
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array())
           ->setQuery("UPDATE ".EmployeeWork::getTable().
                      " SET number_of_payments = NULL,".
                            "total_unpaid_without_tax= total_price_with_tax,".
                            "total_unpaid_with_tax =total_price_with_tax,".      
                            "total_required_without_tax =0,".
                            "total_required_with_tax =0,".
                            "is_completed='NO',".
                            "iteration=0,".
                            "batch=NULL,".
                            "state = NULL".
                     ";")
           ->makeSqlQuery(); 
       
       
    }*/
    
}
