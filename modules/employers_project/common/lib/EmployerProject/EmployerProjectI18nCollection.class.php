<?php

class EmployerProjectI18nCollection extends mfObjectCollection3 {
    
    
    function add(EmployerProjectI18n $project_i18n)
    {
        if (isset($this->collection[$project_i18n->get('id')]))
            return $this;
       $this->collection[$project_i18n->get('id')]=$project_i18n;                
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
            $this->_collection=new EmployerProjectI18nCollection();          
            foreach ($this as $item)
            {               
                if ($item->get('title'))                   
                    $this->_collection[]=$item;
            }                        
          //  var_dump($this->_collection->getLanguages(),$this->getFirst()->get('project_id'));
             $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('project_id'=>$this->getFirst()->get('project_id')))             
                ->setQuery("DELETE FROM ".EmployerProjectI18n::getTable().                         
                           " WHERE lang NOT IN('".$this->getLanguages()->getCodes()->implode("','")."')".
                           ";")               
                ->makeSqlQuery();  
            if ($this->isLoaded())
               $this->_collection->loaded();
        }
        return $this->_collection;
    }
    
   /*  function unset($index)
     {
         
     }*/
}

