<?php

class EmployeePortfolioDocumentBase extends mfOrderedObject3 {
     
    const EMPLOYEE_USER_PORTFOLIO_DOCUMENT_MAX_SIZE=8 * 1024 * 1024;
    
    protected static $fields=array('employee_user_id','is_active','is_public','position','file','extension','filesize','created_at','updated_at');
    const table="t_employee_portfolio_document"; 
     protected static $foreignKeys=array( 
                                         'employee_user_id'=>'Employee'
                                        ); 
    
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
        
      }   
    }
         
    protected function getDefaults()
    {
       $this->setIfNotNull(array(
           'created_at'=>date("Y-m-d H:i:s"),
           'updated_at'=>date("Y-m-d H:i:s"),
           'is_active'=>'YES',
           'is_public'=>'Y',           
        ));
       parent::getDefaults();
    }     
   
    function getValuesForUpdate()
    {
      $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
       
       protected function executeLastPositionQuery($db)
    {
     $db->setParameter('employee_user_id',$this->get('employee_user_id'))
        ->setQuery("SELECT max(position) FROM ".static::getTable()." WHERE employee_user_id='{employee_user_id}';")
        ->makeSqlQuery(); 
    }
    
    protected function executeShiftUpQuery($db)
    {
            $db->setParameter('employee_user_id',$this->get('employee_user_id'))
            ->setQuery("UPDATE ".static::getTable()." SET position=position + 1 WHERE position < %d AND position >= %d AND employee_user_id='{employee_user_id}';")
           ->makeSqlQuery();   
    }
    
    protected function executeShiftDownQuery($db)
    {
           $db->setParameter('employee_user_id',$this->get('employee_user_id'))
           ->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d AND position <= %d AND employee_user_id='{employee_user_id}';")
            ->makeSqlQuery(); 
    }
    
    protected function executeShiftQuery($db)
    {
          $db->setParameter('employee_user_id',$this->get('employee_user_id'))
           ->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d AND employee_user_id='{employee_user_id}';")
           ->makeSqlQuery(); 
    }
    
    protected function executeSiblingQuery($db)
    {
           $db->setParameter('employee_user_id',$this->get('employee_user_id'))
          ->setQuery("SELECT * FROM ".static::getTable()." WHERE position={position} AND employee_user_id='{employee_user_id}' ;")
          ->makeSqlQuery();     
    }
    
       
    static  function updatePositions(mfArray $positions)
    {
         if ($positions->isEmpty())
            return ;
         $db=mfSiteDatabase::getInstance();
         foreach ($positions as $position=>$id)
         {    
                $db->setParameters(array('position'=>$position+1,'id'=>$id,'employee_user_id'=>$this->get('employee_user_id')))
                   ->setQuery("UPDATE ".self::getTable()." SET position={position}".
                              " WHERE id={id} AND employee_user_id='{employee_user_id}'".                    
                              ";")               
                ->makeSqlQuery(); 
         }                
         // Renumbering the rest if exists
         $db->setQuery("SELECT @position:=".$positions->count().";")
              ->makeSqlQuery();        
         $db->setParameters(array('employee_user_id'=>$this->get('employee_user_id')))
            ->setQuery("UPDATE ".self::getTable()." SET position=( SELECT @position:=@position+1 ) ".
                      " WHERE id NOT IN('".$positions->implode("','")."')".
                            " AND employee_user_id='{employee_user_id}'".
                      " ORDER BY position;")
           ->makeSqlQuery();   
         return $this;       
    }
    
    function  asPrevSibling()
    {
        return $this;
    }
    
    function moveTo($node)
    {        
        if ($node===null)
        {            
           $this->set('position',1)->save();
            $db=mfSiteDatabase::getInstance() 
               ->setQuery("SELECT @position:=1;")
               ->makeSqlQuery();        
            $db->setParameters(array('employee_user_id'=>$this->get('employee_user_id'),'id'=>$this->get('id')))
                ->setQuery("UPDATE ".self::getTable()." SET position=( SELECT @position:=@position+1 ) ".
                      " WHERE id !='{id}' AND employee_user_id='{employee_user_id}'".
                      " ORDER BY position;")
            ->makeSqlQuery();               
            return $this;
        }  
        if ($node->get('position') <= $this->get('position'))
        {              
            $this->set('position',$node->get('position') + 1)->save();         
            $db=mfSiteDatabase::getInstance() 
                ->setParameters(array('employee_user_id'=>$this->get('employee_user_id'),'id'=>$this->get('id'),'position'=>$this->get('position')))
                ->setQuery("UPDATE ".self::getTable()." SET position= position + 1 ".
                      " WHERE position >= '{position}' AND id !='{id}' AND employee_user_id='{employee_user_id}'".
                      " ORDER BY position;")
            ->makeSqlQuery();               
            return $this;
        }
        else
        {      
            $db->setParameters(array('employee_user_id'=>$this->get('employee_user_id'),'id'=>$this->get('id'),
                                     'lb'=>$this->get('position'),
                                     'rb'=>$node->get('position')))
                ->setQuery("UPDATE ".self::getTable()." SET position=position - 1 ".
                      " WHERE position >= '{lb}' AND position <= '{rb}' AND id !='{id}' AND employee_user_id='{employee_user_id}'".
                      ";")
             ->makeSqlQuery();         
             $this->set('position',$node->get('position'))->save();     
        }    
        return $this;
    }
    
  /*  protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSqlQuery();       
    }*/
    
     public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/data/employees/portfolio/documents/".$this->get('id');
    }
      
     function getEmployeeUser()
    {
       return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;                 
    }  
    
     function getFileManager()
    {    
        return $this->_file=$this->_file===null?new EmployeePortfolioDocumentFileManager($this):$this->_file;   
    }
    
     function getFormatter()
    {    
        return $this->formatter=$this->formatter===null?new EmployeePortfolioDocumentFormatter($this):$this->formatter;   
    }
    
     function setFile(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__file=$file;
        $this->set('file',(string)mfString::getInstance($file->getOriginalFilename())->noaccent()->replace(' ','-')->limit(10).".".$file->getOriginalExtension());          
        $this->set('filesize',$file->getFilesize());
        $this->set('extension',$file->getOriginalExtension());
        return $this;
    }             
    
    function getName($name)
    {
       return (string)mfString::getInstance($name)->noaccent()->replace(' ','-');
    }
    
   /* function getPictureName()
    {
        return $this->getName($this->getProduct()->getI18n()->get('title'));
    }*/
    
    function create(mfValidatedFile $file)
    {               
        if (!$this->get('employee_user_id'))
            return $this;
        $this->setFile($file);
        $this->save();
        $file->save($this->getFileManager()->getPath(),$this->get('file'));  
        $this->getFileManager()->generate();               
        return $this;
    } 
   
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
        
     function hasI18n()
    {
         return (boolean)$this->i18n; 
    }
    
     public function getI18n($lang=null)
     {       
         if ($this->i18n===null)
         {
             if ($lang==null)
                 $lang=  mfcontext::getInstance()->getUser()->getLanguage();
             $this->i18n=new EmployeePortfolioDocumentI18n(array('lang'=>$lang,"document_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
     
     public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     } 	
     
       function isOpened()
    {
        return $this->get('is_public')=='Y';
    }
    
     function isPrivated()
    {
        return !$this->isPublic();
    }
    
    function privated()
    {
        return $this->set('is_public','N')->save();
    }
    
    function opened()
    {
         return $this->set('is_public','Y')->save();
    }
     
     
    function getUrl()
    {
        return url_to("employees_portfolio_download",array('file'=>$this->get('file'),'employee'=>$this->getEmployeeUser()->get('username')));
    }
    
    function getI18ns()
    {
        return $this->i18ns=$this->i18ns===null?new EmployeePortfolioDocumentI18nCollection($this):$this->i18ns;
    }
    
    
    function updateI18ns(mfArray $document_i18ns)
    {    
        $this->getI18ns()->clear();
        if ($document_i18ns->isEmpty())
        {
             $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('document_id'=>$this->get('id')))                
                ->setQuery("DELETE FROM ".EmployeePortfolioDocumentI18n::getTable().                                                
                           " WHERE ".EmployeePortfolioDocumentI18n::getTableField('document_id')."='{document_id}' AND application='frontend'".                                                                
                           ";")               
                ->makeSqlQuery();  
             return $this;
        }    
         $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('document_id'=>$this->get('id')))                
                ->setQuery("SELECT ".EmployeePortfolioDocumentI18n::getFieldsAndKeyWithTable(). " FROM ".EmployeePortfolioDocumentI18n::getTable().                         
                           " INNER JOIN ".Language::getTable()." ON ".Language::getTableField('code')."=".EmployeePortfolioDocumentI18n::getTableField('lang').   
                           " WHERE ".EmployeePortfolioDocumentI18n::getTableField('document_id')."='{document_id}' AND application='frontend'".                                       
                           " ORDER BY ".Language::getTableField('position')." ASC".
                           ";")               
                ->makeSqlQuery(); 
        if ($db->getNumRows())
        {
            while ($item=$db->fetchObject('EmployeePortfolioDocumentI18n'))
            {                            
                $this->getI18ns()->set($item->get('lang'),$item->loaded());  
            } 
            $this->getI18ns()->loaded();
        }        
        foreach ($document_i18ns   as $values)
        {
            if ($this->getI18ns()->hasItemByKey($values['lang']))                          
                $this->getI18ns()->getItemByKey($values['lang'])->add($values);     
            else
            {    
                $i18n = new EmployeePortfolioDocumentI18n();   
                $i18n->set('document_id',$this)->add($values);            
                $this->getI18ns()->set($values['lang'],$i18n);
            }
        }        
        $this->getI18ns()->save();         
        return $this;
    }
    
     function getFileMaxSize()
    {
        return format_size(self::EMPLOYEE_USER_PORTFOLIO_DOCUMENT_MAX_SIZE);
    }
}
