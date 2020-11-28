<?php


class PartnerWorkCategoryMenuCore extends TreeNode {
    
      protected static $fields=array('name','category_id','picture','icon','awe','rb','lb','level','is_active','state','created_at','updated_at');   
    const table="t_partner_work_category_menu";    
    protected static $fieldsNull=array('category_id');  
    protected static $foreignKeys=array('category_id'=>'PartnerWorkCategory'); // By default
    
    static function root()
    {        
         return  new PartnerWorkCategoryMenu('root');         
    }      
    
    function getRoot()
    {                     
      if ($this->lb==1 && $this->level==0 && $this->name=='root')
          return $this;
      if ($this->_root)
          return $this->_root;     
      $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT * FROM ".static::getTable()." WHERE lb=1 AND level=0;")
            ->makeSqlQuery();
      if (!$db->getNumRows())
            return false; 
      $this->_root=$db->fetchObject(get_class($this))->loaded();
      return $this->_root;
    }
    
    protected function _getRoot()
    {           
       $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT * FROM ".static::getTable()." WHERE lb=1 AND level=0;")
            ->makeSqlQuery();
       if ($db->getNumRows())
       {    
          $this->_root=$db->fetchObject(get_class($this))->loaded();               
       }  
       else
       {             
          $this->_root=$this->createRoot();    // Root doesn't exist
       }           
       return $this->_root;
    }
   
    protected function loadByName($name)
    {                 
        if ($name=='root')
        {
            if (($root=$this->_getRoot()))
                $this->toObject($root);
        }   
        else        
        {
              $db=mfSiteDatabase::getInstance()
                ->setParameters(array('name'=>$name))
                ->setQuery("SELECT * FROM ".static::getTable()."  WHERE name='{name}' LIMIT 0,1;")
                ->makeSqlQuery();  
            $this->rowtoObject($db);
        }    
        return $this;         
    }        
    
     protected function getRootDefaults()
    {
        $this->add(array(
            'lb'=>1,
            'rb'=>2,
            'level'=>0,     
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
            'is_active'=>'NO',
            'state'=>'ACTIVE'
        ));       
    }  
  
     function isExist()
    {
       $db=mfSiteDatabase::getInstance();
       $this->executeIsExistQuery($db);
       return $db->getNumRows();
    }
    
    
    function hasCategory()
    {
        return (boolean)$this->get('category_id');
    }
    
      function getCategory()
    {
       return $this->_category_id=$this->_category_id===null?new PartnerWorkCategory($this->get('category_id')):$this->_category_id;                 
    }  
}

