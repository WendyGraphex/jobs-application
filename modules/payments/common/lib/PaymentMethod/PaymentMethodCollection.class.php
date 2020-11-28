<?php

class PaymentMethodCollection extends mfObjectCollection3 {
        
     function toSelect()
    {      
        if ($this->to_select===null)
        {
            $this->to_select =new mfArray();
            foreach ($this as $item)
               $this->to_select[$item->get('name')]=$item->get('name') ;
        }   
        return $this->to_select;  
    }
     
    
    function getMethods()
    {      
        if ($this->methods===null)
        {
            $this->methods =array();
            foreach ($this as $item)
               $this->methods[]=$item->get('name') ;
        }   
        return $this->methods;  
    }
    
    
    function byIndex()
    {
        if ($this->by_index===null)
        {
            $this->by_index =new self();
            foreach ($this as $item)
               $this->by_index[]=$item;
        }   
        return $this->by_index  ;
    }
    
    
    function bySettings()
    {
        if ($this->by_settings===null)
        {
            $this->by_settings =new self();
            foreach ($this as $item)
            {
               if  (!$item->hasEngine())
                   continue;
               if  (!$item->getEngine()->hasEmployeeSettings())
                   continue;                   
               $this->by_settings[]=$item;
            }
        }   
        return $this->by_settings  ;                        
    }
    
    function byNames()
    {
        if ($this->by_names===null)
        {
            $this->by_names =new self();
            foreach ($this as $item)
               $this->by_names[$item->get('name')]=$item;
        }   
        return $this->by_names  ;
    }
    
    /*
    function getAllValidated()
    {
       if ($this->isNotLoaded())
        {    
            $db=mfSiteDatabase::getInstance()
                       ->setParameters(array()) 
                    ->setObjects(array('PaymentMethod','PaymentEmployeeSettings'))
                       ->setQuery("SELECT ".PaymentMethod::getFieldsAndKeyWithTable()." FROM ".PaymentEmployeeMethod::getTable().   
                                  " INNER JOIN ". PaymentEmployeeMethod::getOuterForJoin('method_id').    
                                  " INNER JOIN ". PaymentEmployeeSettings::getInnerForJoin('method_id').    
                                  " WHERE ".PaymentEmployeeMethod::getTableField('is_active')."='YES' AND ".  
                                           PaymentMethod::getTableField('is_active')."='YES' AND ".  
                                           PaymentEmployeeSettings::getTableField('is_validated')."='YES'".
                                  ";")
                       ->makeSqlQuery();   
           if (!$db->getNumRows())
                   return $this;         
           while ($items=$db->fetchObjects())
           {           
               $item=$items->getPaymentEmployeeSettings();
               $item->set('method_id',$item->getPaymentMethod());
              $this[$item->get('id')]=$item;
           }
           $this->isloaded();
        }
        return $this; 
  
    }*/
    
    
    function getAll()
    {
        if ($this->isNotLoaded())
        {    
            $db=mfSiteDatabase::getInstance()
                       ->setParameters(array())                               
                       ->setQuery("SELECT ".PaymentMethod::getFieldsAndKeyWithTable()." FROM ".PaymentEmployeeMethod::getTable().   
                                  " INNER JOIN ". PaymentEmployeeMethod::getOuterForJoin('method_id').    
                                  " WHERE ".PaymentEmployeeMethod::getTableField('is_active')."='YES' AND ".  
                                           PaymentMethod::getTableField('is_active')."='YES'".  
                                  ";")
                       ->makeSqlQuery();   
           if (!$db->getNumRows())
                   return $this;         
           while ($item=$db->fetchObject('PaymentMethod'))
           {                                   
              $this[$item->get('id')]=$item->loaded();
           }
           $this->isloaded();
        }
        return $this;
    }
}

