<?php


     
class EmailerSpoolerSchedulerBase extends mfObject2 {
     
    protected static $fields=array('number_of_emails','has_error','error_code','number_of_emails_sent','created_at','updated_at');
    protected static $foreignKeys=array(); 
    protected static $fieldsNull=array('number_of_emails'); 
    const table="t_emailer_spooler_scheduler"; 
    
    protected $emails_tosend=null;
    
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
    
  
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
            ->makeSqlQuerySuperAdmin();
    }
    
    protected function getDefaults()
    {
       $this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");
       $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
       $this->has_error=isset($this->has_error)?$this->has_error:"NO";
       $this->status=isset($this->status)?$this->status:"ACTIVE";
       $this->number_of_emails_sent=isset($this->number_of_emails_sent)?$this->number_of_emails_sent:0;
    }
     
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuerySuperAdmin();
    }
    
    function getValuesForUpdate()
    {
       $this->set('updated_at',date("Y-m-d H:i:s"));
    }   
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;")
          ->makeSqlQuerySuperAdmin();
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
           ->makeSqlQuerySuperAdmin();
    }
    
   /* protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSiteSqlQuery($this->site);      
    }*/
    
   
    function getRestOfEmailsNeeded()
    {       
        if ($this->emails_tosend->isEmpty())
            $conditions="";
        else
        {
            $values=new mfArray();
            foreach ($this->emails_tosend as $item)
                $values[]="(`to`='".$item->get('to')."' AND `from`='".$item->get('from')."')";                        
            $conditions=" AND id NOT IN('".implode("','",$this->emails_tosend->getKeys())."') AND NOT(".$values->implode(" OR ").")";  
        }    
                      
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array('limit'=>$this->getSettings()->get('number_of_emails',10) - $this->emails_tosend->count()))                
                ->setQuery("SELECT * FROM ".EmailerSpooler::getTable().
                           " WHERE state IS NULL ". $conditions.
                           " ORDER BY id ASC".
                           " LIMIT 0,{limit}".
                           ";")               
                ->makeSqlQuerySuperAdmin(); 
      //  echo $db->getQuery()."\n";
        if (!$db->getNumRows())
        {            
            return false;      
        }    
        while ($item=$db->fetchObject('EmailerSpooler'))
        {          
           if ($this->emails_tosend->in($item))
                 continue;                                    
           $this->emails_tosend[$item->get('id')]=$item->loaded();
        }        
        $this->emails_tosend->loaded();
      //  echo "Count=".$this->emails_tosend->count()."\n";                
        return true;
    }
    
    function getEmailsToSend()
    {
        $this->emails_tosend=new EmailerSpoolerCollection();                                     
        while ($this->getRestOfEmailsNeeded() && $this->emails_tosend->count() <= $this->getSettings()->get('number_of_emails',10))
        {                 
          
        }        
        $this->emails_tosend->updateEmailStateInProgress();        
        $email_scheduler_collection=new EmailerSpoolerSchedulerEmailSentCollection();         
        foreach ($this->emails_tosend as $item)
        {                  
            $email_scheduler=new EmailerSpoolerSchedulerEmailSent();        
            $email_scheduler->add(array('scheduler_id'=>$this,'email_id'=>$item->loaded()));
            $email_scheduler_collection[]=$email_scheduler;
        }
         $email_scheduler_collection->save();
     /*   $db=mfSiteDatabase::getInstance()
                ->setParameters(array())                
                ->setQuery("SELECT * FROM ".EmailerSpooler::getTable().
                           " WHERE state IS NULL".
                           ";")               
                ->makeSqlQuerySuperAdmin(); 
        if (!$db->getNumRows())
            return $this;     
        $emails=new mfArray();
        while ($item=$db->fetchObject('EmailerSpooler'))
        {
           if ($emails->in($item->get('to')))
                 continue;
           $emails[]=$item->get('to');
           $email_scheduler=new EmailerSpoolerSchedulerEmailSent();
           $email_scheduler->add(array('scheduler_id'=>$this,'email_id'=>$item->loaded()));
           $email_scheduler_collection[]=$email_scheduler;
        }                
        $email_scheduler_collection->save();
        $email_scheduler_collection->updateEmailStateInProgress();        
       */ 
                
        $this->set('number_of_emails',$email_scheduler_collection->count());
        return $this;       
    }
    
    function getLastEmail()
    {        
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("SELECT * FROM ".EmailerSpoolerSchedulerEmailSent::getTable().                          
                           " WHERE has_error='NO' AND is_sent='NO' ".
                           " ORDER BY id ASC ".
                           " LIMIT 0,1".
                           ";")                                                        
                ->makeSqlQuery();  
        if (!$db->getNumRows())
              return null;  
        return  $db->fetchObject('EmailerSpoolerSchedulerEmailSent')->loaded();
    }
    
    function processLastEmail()
    {
        $last_email_to_do=$this->getLastEmail();                
        if ($last_email_to_do)
        {
            $last_email_to_do->set('scheduler_id',$this);
            
            
            $last_email_to_do->process();                                                       
            if ($last_email_to_do->hasError())
            {
                 $this->set('has_error','YES');       
                 throw new mfException($last_email_to_do->getErrorCode());
            }         
        }   
        return $last_email_to_do;
    }
    
    function getSettings()
    {
        if ($this->settings===null)
        {
          $this->settings=  EmailerSpoolerSettings::load();
        }    
        return $this->settings;
    }
    
    function process()
    {             
        
        $this->save();
        $this->getEmailsToSend();                    
        $emails_sent=0;
        try
        {
                $index=0;
                while ($index < $this->getSettings()->get('number_of_emails',10) && $this->processLastEmail())
                {                    
                        $index++;                                            
                        $emails_sent++;
                }                                      
        } 
        catch (mfException $e) 
        {
            $this->set('has_error','YES');    
            $this->set('error_code',$e->getMessage());    
        }                   
        $this->set('number_of_emails_sent',$index); 
        $this->save();
        return $this;
    }
    
}
