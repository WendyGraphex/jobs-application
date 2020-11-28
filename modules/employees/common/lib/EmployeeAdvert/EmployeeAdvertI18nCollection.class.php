<?php

class EmployeeAdvertI18nCollection extends mfObjectCollection3 {
    
    
    function add(EmployeeAdvertI18n $advert_i18n)
    {
        if (isset($this->collection[$advert_i18n->get('id')]))
            return $this;
       $this->collection[$advert_i18n->get('id')]=$advert_i18n;                
        return $this;
    }
    
    function getLanguages()
    {
        if ($this->languages===null)
        {
            $this->languages=new mfLanguageCollection();
            foreach ($this as $item)
            {    
                $this->languages[]=new mfLanguage($item->get('lang'));
            }
        } 
        return $this->languages;
    }
            
    function getCollection()
    {
        if ($this->_collection===null)
        {                
            $this->_collection=new EmployeeAdvertI18nCollection();          
            foreach ($this as $item)
            {               
                if ($item->get('title'))                   
                    $this->_collection[]=$item;
            }                        
          //  var_dump($this->_collection->getLanguages(),$this->getFirst()->get('advert_id'));
             $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('advert_id'=>$this->getFirst()->get('advert_id')))             
                ->setQuery("DELETE FROM ".EmployeeAdvertI18n::getTable().                         
                           " WHERE lang NOT IN('".$this->getLanguages()->getCodes()->implode("','")."')".
                           ";")               
                ->makeSqlQuery();  
            if ($this->isLoaded())
               $this->_collection->loaded();
        }
        return $this->_collection;
    }
    
    
    function toArrayForEmail()
    {
        $values= array();
        foreach ($this as $item_i18n)
            $values[]=$item_i18n->getFormatter()->toArrayForEmail();
        return $values;
    }
   
}

