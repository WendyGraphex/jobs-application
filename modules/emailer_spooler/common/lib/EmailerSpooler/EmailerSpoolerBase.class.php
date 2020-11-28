<?php

/*
 * 1 email par spooler
 */
     
class EmailerSpoolerBase extends mfObject2 {
     
    protected static $fields=array('from','sent_at','to','cc','bcc','site_id','is_sent','body','subject','status','state','created_at','updated_at');
    protected static $foreignKeys=array('site_id'=>'Site'); 
    protected static $fieldsNull=array('state','sent_at','site_id'); // By default
    const table="t_emailer_spooler"; 
    
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
       $this->is_sent=isset($this->is_sent)?$this->is_sent:"NO";       
       $this->status=isset($this->status)?$this->status:"ACTIVE";
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
    
   
    function getSite()
    {
        if ($this->_site_id===null)
        {
          $this->_site_id=new Site($this->get('site_id'));  
        }   
        return $this->_site_id;
    }
   
    function getTo()
    {
        if ($this->_to===null)
        {
           $str=new mfString($this->get('to'));
           $this->_to=$str->explode(',');
        }   
        return $this->_to;
    }
    
    function getBcc()
    {
        if ($this->_bcc===null)
        {
           $str=new mfString($this->get('bcc'));
           $this->_bcc=$str->explode(',');
        }   
        return $this->_bcc;
    }
    
      function getBodyContent()
    {
         preg_match("/<body>(.*)<\/body>/s", $this->get('body'), $matches);  
         return $matches[1];
    }
    
    static function updateStateInProgressForEmails(mfArray $emails)
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters()
                ->setQuery("UPDATE ".EmailerSpooler::getTable().
                           " SET state='INPROGRESS'".
                           " WHERE id IN('".$emails->implode("','")."')".
                           ";")               
                ->makeSqlQuerySuperAdmin(); 
    }
    
    static function getSitesForSelect()
    {
        $list=new mfArray();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("SELECT ".EmailerSpooler::getTableField('site_id').",site_host FROM ".EmailerSpooler::getTable().  
                           " INNER JOIN ".EmailerSpooler::getOuterForJoin('site_id').
                           ";")                                                        
                ->makeSqlQuerySuperAdmin();  
        if (!$db->getNumRows())
              return $list;  
        while ($row=$db->fetchArray())
        {     
            $list[$row['site_id']]=$row['site_host'];
        }
        return $list;
    }
}
