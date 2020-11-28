<?php


class PaymentPaypalSettingsBase extends mfObject2 {
    
    const table="t_payment_paypal_settings"; 
    protected static $fields=array('mode','client','secret','payer','created_at','updated_at',);
    protected static $foreignKeys=array(); 
    protected static $fieldsNull=array(); 
    
  function __construct($parameters=null,$site=null) {
      parent::__construct(null,$site);    
    $this->getDefaults();  
    if ($parameters===null) return $this;  
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);
          /* if (isset($parameters['name']))
               return $this->loadByName((string)$parameters['name']); */
           return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
             $this->loadbyId((string)$parameters);
         else
             $this->loadbyMode((string)$parameters); 
      }   
    }
    
    protected function loadByMode($mode)
    {     
        $this->set('mode',$mode);      
        $db=mfSiteDatabase::getInstance()->setParameters(array('mode'=>$mode));
        $db->setQuery("SELECT * FROM ".self::getTable()." WHERE mode='{mode}';")
            ->makeSiteSqlQuery($this->site);                           
        return $this->rowtoObject($db);    
    }   
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
            ->makeSiteSqlQuery($this->site);   
    }
    
    protected function getDefaults()
    {    	
       //$this->returnurl=isset($this->returnurl)?$this->returnurl:"";
        $this->cancelurl=isset($this->cancelurl)?$this->cancelurl:"/paiement/paypal/Cancelled";
        $this->accepturl=isset($this->accepturl)?$this->accepturl:"/paiement/paypal/Accepted";               
	$this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
	$this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");
    }
    
    protected function executeInsertQuery($db)
    {
         $db->makeSiteSqlQuery($this->site);   
    }
    
    function getValuesForUpdate()
    {
          
    }   
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;")
          ->makeSiteSqlQuery($this->site);    
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
           ->makeSiteSqlQuery($this->site);     
    }
    
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";     
      $db->setParameters(array("mode"=>$this->get('mode'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE mode='{mode}' ".$key_condition)
         ->makeSiteSqlQuery($this->site); 
    }
    
    
    static function getModesForSelect()
    {
        $list=new mfArray();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("SELECT * FROM ".self::getTable().";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return  $list;
        while ($item=$db->fetchObject('PaymentPaypalSettings'))
        {
           $list[$item->get('id')]=  $item->get('mode');
        }     
        
        return $list;
    }
    
    static function getModes()
    {
        $list=new PaymentPaypalSettingsCollection();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("SELECT * FROM ".self::getTable().";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return  $list;
        while ($item=$db->fetchObject('PaymentPaypalSettings'))
        {
           $list[$item->get('id')]=  $item->loaded();
        }     
        
        return $list;
    }
    
    static function updateModes(mfArray $modes,$mode)
    {
       // var_dump($modes,$mode);
        $settings= new PaypalSettings();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("DELETE FROM ".self::getTable().";")               
                ->makeSqlQuery(); 
        if ($modes->isEmpty())
            return ;
       $collection=new PaymentPaypalSettingsCollection();
       foreach ($modes as $values)
       {
           $item=new PaymentPaypalSettings();
           $item->add($values);
           $collection[]=$item;       
       }       
       $collection->save();    
       if ($collection->count() == 1)
       {
           $settings->set('paypal_settings_mode',$collection->getFirst()->get('id'))->save();
       }    
    }
}



