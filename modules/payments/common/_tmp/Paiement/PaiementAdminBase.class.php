<?php


class paymentAdminBase extends paymentBase {
   
    function getComponentChangeStatusView()
    {
        return "/".$this->get('module')."/ChangeStatusView";
    }                
    
    function getName()
    {        
        return strtolower(str_replace("payments_","",$this->get('module')));
    }
    
    function getSettings()
    {
        $class="payment".ucfirst($this->getName())."Settings";
        if (class_exists($class))
        {          
           return $class::load($this->getSite());
        }   
        return null;
    }
                 
    function updateCountries($countries)
    {        
        if ($this->isNotLoaded())
            return $this;
         // Get country not in countries for remove
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array("payment_id"=>$this->get('id')))               
                ->setQuery("SELECT country FROM ".paymentCountry::getTable()." WHERE payment_id={payment_id} AND country NOT IN('".implode("','",$countries)."');")               
                ->makeSiteSqlQuery($this->getSite());  
        if ($db->getNumRows())
        {             
            $countries_to_delete=array();
            while ($row=$db->fetchArray())
                 $countries_to_delete[]=$row['country'];   
            // Remove them
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array("payment_id"=>$this->get('id')))               
                ->setQuery("DELETE FROM ".paymentCountry::getTable()." WHERE payment_id={payment_id} AND country IN('".implode("','",$countries_to_delete)."');")               
                ->makeSiteSqlQuery($this->getSite());  
        }                
        // get existing countries
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("payment_id"=>$this->get('id')))
                ->setQuery("SELECT country FROM ".paymentCountry::getTable()." WHERE payment_id={payment_id} AND country IN('".implode("','",$countries)."');")               
                ->makeSiteSqlQuery($this->getSite()); 
        if ($db->getNumRows())
        {          
            while ($country=$db->fetchArray())
                unset($countries[array_search($country['country'],$countries)]);
        }    
        // Insert new countries
        $collection=new paymentCountryCollection(null,$this->getSite());
        foreach ($countries as $country)
        {   
            $item=new paymentCountry(null,$this->getSite());
            $item->set('payment_id',$this->get('id'));
            $item->set('country',$country);
            $collection[]=$item;
        }   
        $collection->save();    
        $this->removeCache();
    }    
    
    function removeCountries()
    {
        if ($this->isNotLoaded())
            return $this;       
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("payment_id"=>$this->get('id')))
                ->setQuery("DELETE FROM ".paymentCountry::getTable()." WHERE payment_id={payment_id};")               
                ->makeSiteSqlQuery($this->getSite()); 
        $this->removeCache();
    }
    
     function updateCurrencies($currencies)
    {   
         
        if ($this->isNotLoaded())
            return $this;
         // Get currency not in currencies for remove
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array("payment_id"=>$this->get('id')))               
                ->setQuery("SELECT currency FROM ".paymentCurrency::getTable()." WHERE payment_id={payment_id} AND currency NOT IN('".implode("','",$currencies)."');")               
                ->makeSiteSqlQuery($this->getSite());  
      
        if ($db->getNumRows())
        {             
            $currencies_to_delete=array();
            while ($row=$db->fetchArray())
                 $currencies_to_delete[]=$row['currency'];   
            // Remove them
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array("payment_id"=>$this->get('id')))               
                ->setQuery("DELETE FROM ".paymentCurrency::getTable()." WHERE payment_id={payment_id} AND currency IN('".implode("','",$currencies_to_delete)."');")               
                ->makeSiteSqlQuery($this->getSite());  
        }
//           var_dump($currencies,$currencies_to_delete);
        // get existing currencies
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("payment_id"=>$this->get('id')))
                ->setQuery("SELECT currency FROM ".paymentCurrency::getTable()." WHERE payment_id={payment_id} AND currency IN('".implode("','",$currencies)."');")               
                ->makeSiteSqlQuery($this->getSite()); 
        if ($db->getNumRows())
        {          
            while ($country=$db->fetchArray())
                unset($currencies[array_search($country['currency'],$currencies)]);
        }    
        // Insert new currencies
        $collection=new paymentCurrencyCollection(null,$this->getSite());
        foreach ($currencies as $currency)
        {   
            $item=new paymentCurrency(null,$this->getSite());
            $item->set('payment_id',$this->get('id'));
            $item->set('currency',$currency);
            $collection[]=$item;
        }   
        $collection->save();    
        $this->removeCache();
    }    
    
    
    function removeCache()
    {                     
        $cache=new mfCacheObject(get_class($this)."/".$this->get('id'),"",'frontend',$this->getSite());      
        return $cache->remove();
    }
    
    function getAvailableStatus()
    {
        $class="payment".ucfirst(str_replace("payments_","",$this->get('module')))."Engine";    
        return $class::getAvailableStatus();
    }
    
}

