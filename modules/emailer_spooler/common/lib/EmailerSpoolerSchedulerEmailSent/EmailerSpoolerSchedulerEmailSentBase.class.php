<?php

     
class EmailerSpoolerSchedulerEmailSentBase extends mfObject2 {
     
    protected static $fields=array('email_id','sent_at','scheduler_id','has_error','error_code','is_sent','created_at','updated_at');
    protected static $foreignKeys=array('email_id'=>'EmailerSpooler',
                                        'scheduler_id'=>'EmailerSpoolerScheduler');  
    protected static $fieldsNull=array('sent_at'); // By default
     
    const table="t_emailer_spooler_scheduler_email_sent"; 
    
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
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters); 
        
      }   
    }
    
   /* protected function loadByName($name)
    {
         $this->set('name',$name);
         $db=mfSiteDatabase::getInstance()->setParameters(array($name));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE name='%s';")
            ->makeSqlQuerySuperAdmin  ();                         
         return $this->rowtoObject($db);
    }*/
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
            ->makeSqlQuerySuperAdmin  ();
    }
    
    protected function getDefaults()
    {
       $this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");
       $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
       $this->is_sent=isset($this->is_sent)?$this->is_sent:"NO";
       $this->has_error=isset($this->has_error)?$this->has_error:"NO";
       $this->status=isset($this->status)?$this->status:"ACTIVE";
    }
     
    protected function executeInsertQuery($db)
    {
       $db->makeSiteSqlQuery($this->site);   
    }
    
    function getValuesForUpdate()
    {
       $this->set('updated_at',date("Y-m-d H:i:s"));
    }   
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;")
          ->makeSqlQuerySuperAdmin  ();
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
           ->makeSqlQuerySuperAdmin  ();
    }
    
   /* protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSiteSqlQuery($this->site);      
    }*/
    
   
    function getEmail()
    {
        if ($this->_email_id===null)
        {
          $this->_email_id=new EmailerSpooler($this->get('email_id'));  
        }   
        return $this->_email_id;
    }
   
    function getScheduler()
    {
        if ($this->_scheduler_id===null)
        {
          $this->_scheduler_id=new EmailerSpoolerScheduler($this->get('scheduler_id'));  
        }   
        return $this->_scheduler_id;
    }
    
    function process()
    {
        $this->set('has_error','NO');
        try
        {
          //  echo "To=".$this->getEmail()->getFrom(). " From=".$this->getEmail()->get('to');            
           $mailer=mfContext::getInstance()->getSiteMailer($this->getEmail()->getSite());
           $mailer->sendMailContent($this->getEmail()->getFrom(),
                                    $this->getEmail()->getTo()->toArray(),
                                    $this->getEmail()->get('subject'),
                                    $this->getEmail()->get('body'),
                                    array(),
                                    $this->getEmail()->getCc()->toArray(),
                                    $this->getEmail()->getBcc()->toArray()
                                );   
           $this->set('is_sent','YES');
           $this->set('sent_at',date("Y-m-d H:i:s"));
           $this->getEmail()->add(array('is_sent'=>'YES',
                                        'sent_at'=>date("Y-m-d H:i:s"),
                                        'state'=>'SENT'));
           $this->getEmail()->save();
        } 
        catch (Exception $e) {
            $this->set('has_error','YES');
            $this->set('error_code',$e->getMessage());
        }           
        $this->save();
    }
    
    function hasError()
    {
        return $this->get('has_error') == 'YES';
    }
    
    function getErrorCode()
    {
        return $this->get('error_code');
    }
}
