<?php

class PaymentModelTextBase extends mfObject3 {
     
    protected static $fields=array('name','module','created_at','updated_at');
    protected static $fieldsNull=array('updated_at'); // By default
    const table="t_payment_model_text"; 
         
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
         return $this->loadByName((string)$parameters);
      }   
    }
    
   protected function loadByName($name)
    {
         $this->set('name',$name);
         $db=mfSiteDatabase::getInstance()->setParameters(array($name));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE name='%s';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }
        
    protected function getDefaults()
    {
      $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),           
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
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSqlQuery();      
    }
    
    public function getI18n($lang=null)
     {        
         if (!$this->i18n)
         {
             if ($lang==null)
                $lang=  mfcontext::getInstance()->getUser()->getLanguage();
             $this->i18n=new PaymentModelTextI18n(array('lang'=>$lang,"model_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
       
    static function getModelsForSelect($lang=null)
    {
        static $list=null;
        if ($list) return $list;
        if ($lang==null)
            $lang=mfContext::getInstance()->getUser()->getLanguage();
        $list=new mfArray();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('lang'=>$lang))
                ->setQuery("SELECT ".PaymentModelTextI18n::getFieldsAndKeyWithTable()." FROM ".PaymentModelTextI18n::getTable().                                                 
                           " WHERE lang='{lang}';")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $list;        
        while ($item=$db->fetchObject('PaymentModelTextI18n'))
        {
           $list[$item->get('model_id')]=$item->get('value');
        }     
        return $list;
    }
    

   
}
