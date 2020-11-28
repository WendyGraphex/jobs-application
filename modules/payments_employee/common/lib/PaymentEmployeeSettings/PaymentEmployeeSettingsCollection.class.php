<?php

class PaymentEmployeeSettingsCollection extends mfObjectCollection3 {
 
    function getAll()
    {
       if ($this->isNotLoaded())
        {              
            $db=mfSiteDatabase::getInstance()
                       ->setParameters(array()) 
                    ->setObjects(array('PaymentMethod','PaymentEmployeeSettings'))
                       ->setQuery("SELECT {fields} FROM ".PaymentEmployeeMethod::getTable().   
                                  " INNER JOIN ". PaymentEmployeeMethod::getOuterForJoin('method_id').    
                                  " INNER JOIN ". PaymentEmployeeSettings::getInnerForJoin('method_id').    
                                  " WHERE ".PaymentEmployeeMethod::getTableField('is_active')."='YES' AND ".  
                                           PaymentMethod::getTableField('is_active')."='YES' ".
                                  ";")
                       ->makeSqlQuery();             
           if (!$db->getNumRows())
                   return $this;         
           while ($items=$db->fetchObjects())
           {           
              $item=$items->getPaymentEmployeeSettings();
              $item->set('method_id',$items->getPaymentMethod());
              $this[$item->get('id')]=$item;
           }
           $this->isloaded();         
        }
        return $this; 
  
    }
    
    
    
    function getMethods()
    {
        return $this->getKeys();
    }
    
    
     public  function __call($method,$args) 
    {                
            if (preg_match('~^(get|has)([A-Z])(.*)$~', $method, $matches)) {          
            $property = strtolower($matches[2]) . $matches[3];            
            if ($matches[1]=='has')
               return isset($this->collection[$property]);            
            switch($matches[1]) {                
                case 'get':    
                    if (isset($this->collection[$property]))
                        return $this->collection[$property];                     
                    $this->collection[$property]=new PaymentEmployeeSettings();
                    return $this->collection[$property];
                default:
                    throw new mfException('class '.get_class($this).' => Method ' . $method . ' not exists.');
            }
          }  
          throw new mfException('Options => Method ' . $method . ' not exists.');
    }  
}

