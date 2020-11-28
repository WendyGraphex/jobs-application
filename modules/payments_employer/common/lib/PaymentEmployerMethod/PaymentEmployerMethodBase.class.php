<?php

class PaymentEmployerMethodBase extends mfOrderedObject3 {
    
    protected static $fields=array('method_id','is_active','position','created_at','updated_at');
    const table="t_payment_employer_method"; 
    protected static $foreignKeys=array('method_id'=>'PaymentMethod'); // By default
        
    function __construct($parameters=null) {
      parent::__construct();
      $this->getDefaults();
      if ($parameters === null)
         return $this;
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
    
    protected function getDefaults()
    {
        parent::getDefaults();
      $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),   
            'is_active'=>'NO',
        ));   
    }
    
   
     function getValuesForUpdate()
    {
         $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
    
      function getCreatedAt()
    {
        return new DateTimeFormatter($this->get('created_at'));
    }
    
    
     function getMethod()
   {
       return $this->_method_id=$this->_method_id===null?new PaymentMethod($this->get('method_id')):$this->_method_id;
   }
   
   static function getAlls()
   {
       $list=new PaymentEmployerMethodCollection();
       $db=mfSiteDatabase::getInstance()
                    ->setParameters(array())   
                    ->setObjects(array('PaymentEmployerMethod','PaymentMethod'))               
                    ->setQuery("SELECT {fields} FROM ".PaymentEmployerMethod::getTable().    
                               " INNER JOIN ". PaymentEmployerMethod::getOuterForJoin('method_id').    
                               ";")
                    ->makeSqlQuery();
        if (!$db->getNumRows())
                return $list;         
        while ($items=$db->fetchObjects())
        {                                   
           $list[$items->getPaymentEmployerMethod()->get('id')]=$items->getPaymentEmployerMethod()->set('method_id',$items->getPaymentMethod());
        }  
       return $list; 
   }
   
   static function updateMethods(mfArray $methods)
   {   
       if ($methods->isEmpty())
       {
           $db=mfSiteDatabase::getInstance();       
            $db->setParameters(array())              
                ->setQuery("DELETE FROM ".self::getTable().                                                                      
                           ";")               
                ->makeSqlQuery();    
           return ;
       }    
       $db=mfSiteDatabase::getInstance();       
            $db->setParameters(array())              
                ->setQuery("DELETE FROM ".self::getTable()." WHERE method_id NOT IN('".$methods->implode("','")."')".                                                                         
                           ";")               
                ->makeSqlQuery();                  
         $db=mfSiteDatabase::getInstance()
                    ->setParameters(array())                      
                    ->setQuery("SELECT method_id FROM ".PaymentEmployerMethod::getTable().    
                               " WHERE method_id IN('".$methods->implode("','")."')".       
                               ";")
                    ->makeSqlQuery();
         if ($db->getNumRows())
         {
              while ($row=$db->fetchArray())
              {
                  $methods->findAndRemove($row['method_id']);
              }        
         }
         $collection = new PaymentEmployerMethodCollection();
         foreach ($methods as $index=>$method_id)
         {    
             $item= new PaymentEmployerMethod();
             $item->add(array('method_id'=>$method_id,'position'=>$index+1));
             $collection->push($item);
         }
         $collection->save();        
   }
   
   
   static function getMethods()
   {
       $list=new PaymentMethodCollection();
       $db=mfSiteDatabase::getInstance()
                    ->setParameters(array())                               
                    ->setQuery("SELECT ".PaymentMethod::getFieldsAndKeyWithTable()." FROM ".PaymentEmployerMethod::getTable().   
                               " INNER JOIN ". PaymentEmployerMethod::getOuterForJoin('method_id').    
                              " WHERE ".PaymentEmployerMethod::getTableField('is_active')."='YES' AND ".  
                                        PaymentMethod::getTableField('is_active')."='YES'".  
                               ";")
                    ->makeSqlQuery();
        if (!$db->getNumRows())
                return $list;         
        while ($item=$db->fetchObject('PaymentMethod'))
        {                                   
           $list[$item->get('id')]=$item->loaded();
        }  
       return $list; 
   }
}
