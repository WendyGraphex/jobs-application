<?php

class CustomerNewsletter extends mfObject3 {
     
    protected static $fields=array('email','ip','is_active','created_at','updated_at');
    protected static $fieldsNull=array('updated_at'); // By default
    const table="t_customer_newsletter"; 
    
    function __construct($parameters=null) {
      parent::__construct();
      if ($parameters === null)
            return $this;
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
              return $this->loadById((string)$parameters['id']);          
           if (isset($parameters['email']))
              return $this->loadByEmail((string)$parameters['email']); 
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            $this->loadById((string)$parameters);     
         else
            $this->loadByEmail((string)$parameters);
      }   
    }
   
    protected function loadByEmail($email)
    {
      $this->set('email',$email);
      $db=mfSiteDatabase::getInstance()
            ->setParameters(array($email))
            ->setQuery("SELECT * FROM ".self::getTable()." WHERE email='%s' LIMIT 1;")
            ->makeSiteSqlQuery($this->site);     
      $this->rowtoObject($db);
    }
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE id=%d;")
            ->makeSiteSqlQuery($this->site);  
    }
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }           
    
     
    protected function getDefaults()
    {
       $this->created_at=date("Y-m-d H:i:s");
       $this->updated_at=date("Y-m-d H:i:s");
       $this->is_active=isset($this->is_active)?$this->is_active:"YES";
    }
       
   /* protected function executeIsExistQuery($db)    
    {
       $db->setParameters(array($this->email))
          ->setQuery("SELECT id FROM ".self::getTable()." WHERE email='%s' LIMIT 1;")
          ->makeSiteSqlQuery($this->site);     
    }*/
    
    /********** M E T H O D S ********************/
    function disabled()
    {
        $this->set('is_active','NO');
        $this->save();
        return $this;
    }
    
    function create($ip)
    {
        $this->set('ip',$ip);
        return $this->save();
    }
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->get('created_at'));
    }
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new CustomerNewsletterFormatter($this):$this->formatter;
   }
}
