<?php

class LanguageCollection extends  orderedObjectCollection {
    
    protected function executeLastPositionQuery($db)
    {
        $db->setQuery("SELECT max(position) FROM ".$this->getTable()." WHERE application@@IN_APPLICATION@@;")
           ->makeSqlQuery($this->application,$this->site); 
    }
        
    protected function executeSelectQuery($db)
    {
       $db->setParameters()
           ->setQuery("SELECT * FROM ".$this->getTable()." WHERE ".$this->getWhereConditions()." AND application@@IN_APPLICATION@@;")
           ->makeSqlQuery($this->application,$this->site);   
    }
    
    protected function executeDeleteQuery($db)
    {
       $db->setParameters()
          ->setQuery("DELETE FROM ".$this->getTable()." WHERE ".$this->getWhereConditions()." AND application@@IN_APPLICATION@@;")
          ->makeSqlQuery($this->application,$this->site);   
    }            
    
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery($this->application,$this->site);   
    } 
    
    protected function executeUpdateQuery($db)
    {
        $db->setQuery("UPDATE ".$this->getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".$this->getWhereConditions().";")
           ->makeSqlQuery($this->application,$this->site); 
    }
    
    protected function executeUpdatePositionQuery($position,$db)
    {
        $db->setParameter('position',$position)
           ->setQuery("UPDATE ".$this->getTable()." SET position=( SELECT @position:=@position+1 ) WHERE position > {position} AND application@@IN_APPLICATION@@;")
           ->makeSqlQuery($this->application,$this->site); 
    }
    
    /* *************** M E T H O D S *******************************************/
    
    function sortByCountry()
    {
        usort ($this->collection , array($this,"cmp_sort"));
    }
    
    function cmp_sort($a,$b)
    {
        $a1=$a->getI18nLanguage();
        $b1=$b->getI18nLanguage();
        if ($a1 == $b1) {
            return 0;
        }
        return ($a1 > $b1) ? +1 : -1;
    }
    
    function toJson()
    {
        $values=new mfArray();
        foreach ($this->collection as $item)
            $values[$item->get('code')]=(string)$item->getFormatter()->getFormatted()->ucfirst();
        $values->asort();
        $output=array();
        foreach ($values as $code=>$i18n)
           $output[]=array('code'=>$code,'i18n'=>$i18n);
       // var_dump($values);
        return json_encode($output);
    }
    
    function getLanguageByCode($code,$default=false)
    {
        
         if ($this->selected===null)
         {    
             $this->selected=$default;
            foreach ($this->collection as $item)
            {
                if ($item->get('code')==strtolower($code))
                {    
                    $this->selected=$item;
                    return $this->selected;
                }
            }
         }
         return $this->selected;   
    }
    
    function forSelect()
    {
      $languages=new mfArray();  
      foreach ($this as $item)
          $languages[$item->get('code')]= ucfirst(format_language($item->get('code')));
      return $languages->asort();
    }
    
    
    function getCodes()
    {
        if ($this->codes===null)
        {
            $this->codes=new mfArray();
            foreach ($this as $item)
                $this->codes[]=$item->get('code');
        }   
        return $this->codes;
    }
    
    
     function byIndex()
    {
        if ($this->index===null)
        {
            $this->index=new $this();
            foreach ($this as $item)
                $this->index[]=$item;
        }   
        return $this->index;
    }
    
    
}

