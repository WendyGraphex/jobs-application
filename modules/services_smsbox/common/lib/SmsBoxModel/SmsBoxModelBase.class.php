<?php


class SmsBoxModelBase extends mfObject3 {
 
    protected static $fields=array('name','content','color','status',
                                   'created_at','updated_at');
    
    const table="t_services_smsbox_model";
            
    function __construct($parameters=null) {
      parent::__construct();
      $this->getDefaults();
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess) {
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);
           return $this->add($parameters); 
      }
      else if (is_numeric((string)$parameters)) {
          $this->loadById((string)$parameters);
      }
    }

    
    protected function getDefaults()
    {
        $this->setIfNotNull(array(
           'created_at'=>date("Y-m-d H:i:s"),
           'updated_at'=>date("Y-m-d H:i:s"),
            'status'=>'ACTIVE',
        ));
    }
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }
    
      protected function executeIsExistQuery($db)
    {
         $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' ".$key_condition)
         ->makeSqlQuery();   
    } 
    
   static function getModelsForSelect()
    {
      $list = new mfArray();
      $db=mfSiteDatabase::getInstance()
          ->setQuery("SELECT name,id FROM ".self::getTable().
                     " ORDER BY name ASC ".                    
                     ";")               
          ->makeSqlQuery();  
      if (!$db->getNumRows())
          return $list;
      while ($row=$db->fetchArray())
      {               
         $list[$row['id']]= mb_strtoupper($row['name']);
      }                
      return $list;
    }

    static function getActiveModelsForSelect()
    {
        $list = new mfArray();
        $db=mfSiteDatabase::getInstance()
            ->setQuery("SELECT name,id FROM ".self::getTable().
                " WHERE status='ACTIVE'  ORDER BY name ASC ".
                ";")
            ->makeSqlQuery();
        if (!$db->getNumRows())
            return $list;
        while ($row=$db->fetchArray())
        {
            $list[$row['id']]= mb_strtoupper($row['name']);
        }
        return $list;
    }

    static function getAllModels()
    {
        $collection = new SmsBoxModelCollection();
        $db=mfSiteDatabase::getInstance()
            ->setQuery("SELECT * FROM ".self::getTable().
                " ORDER BY name ASC ".
                ";")
            ->makeSqlQuery();
        if (!$db->getNumRows())
            return $collection;

        if ($db->getNumRows())
        {
            while ($item=$db->fetchObject('SmsBoxModel'))
            {
                $collection[$item->get('id')]=$item->loaded();
            }
        }
        return $collection;
    }


    function getMessage()
    {
        return $this->get('content');
    }


    function toArrayStatus()
    {
        return array(
            "delete"=>$this->getStatusAwe(false),
            "active"=>$this->getStatusAwe(),
            "text"=>$this->getStatusText(),
            "status" =>$this->get('status')
        );
    }

    function getStatusAwe($way=true)
    {
        if ($way)
            return $this->get('status')=='ACTIVE'?"times":"recycle";
        return $this->get('status')=='ACTIVE'?"recycle":"times";
    }

    function getStatusText()
    {
        return $this->get('status')=='ACTIVE'?"Désactiver":"Activer";
    }
  
}

