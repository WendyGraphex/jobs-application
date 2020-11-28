<?php


class PictureCollectionExistsValidator extends mfValidatorString {

    protected $site=null;
    
    function __construct($options=array(),$site=null)
    {
        $this->site=$site;        
        parent::__construct($options);       
    }
    
    protected function getSite()
    {
        return $this->site;
    }
    
    protected function configure($options,$messages)
    { 
       parent::configure($options,$messages);
       $this->setOption("empty_value",array()); // in case of value is null             
    }
  
    protected function doIsValid($values) 
    {        
         if (!is_array($values))
             $values=(array)$values;
        $db=mfSiteDatabase::getInstance();
          $escapes=array();
         foreach ($values as $value)
            $escapes[]=$db->escape($value);
         $db->setQuery("SELECT count(".Picture::getKeyName().") FROM ".Picture::getTable().
                           " WHERE ".Picture::getTableField('id')." IN('".implode("','",$escapes)."')".
                           ";")               
                ->makeSiteSqlQuery(); 
         $row=$db->fetchRow();
         if (count($values)!=$row[0])                                                                         
           throw new mfValidatorError($this, 'invalid');        
        return $values;
    }

}
