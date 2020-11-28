<?php 
    
class EmployeeContentBase extends mfObject3 {
     
    const  EMPLOYEE_USER_CONTENT_MAX_SIZE=8 * 1024 *1024;
      
    protected static $fields=array('name','picture','template','employee_user_id','created_at','updated_at');
    const table="t_employee_content"; 
    protected static $foreignKeys=array('employee_user_id'=>'Employee'); // By default
    
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
         if ($parameters instanceof Employee)
             return $this->loadbyEmployeeUser($parameters);               
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);              
      }   
    }
    
    protected function loadByEmployeeUser(Employee $employee)
    {    
         if ($employee->isNotLoaded())
             return ;
         $this->set('employee_user_id',$employee);         
         $db=mfSiteDatabase::getInstance()->setParameters(array('employee_user_id'=>$employee->get('id')));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE employee_user_id='{employee_user_id}';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);   
    } 
    
  /*  protected function loadByName($name)
    {    
         $this->set('name',$name);         
         $db=mfSiteDatabase::getInstance()->setParameters(array('name'=>$name));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE name='{name}';")
            ->makeSiteSqlQuery($this->site);                           
         return $this->rowtoObject($db);   
    }    */
    
      protected function getDefaults()
    {    
      $this->setIfNotNull(array(
          'template'=>'default.tpl',
          'created_at'=>date("Y-m-d H:i:s"),
          'updated_at'=>date("Y-m-d H:i:s"),
      ));      
    }
     
     
    function getValuesForUpdate()
    {
       $this->set('updated_at',date("Y-m-d H:i:s"));   
    }            
    
   /* protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' ".$key_condition)
         ->makeSiteSqlQuery($this->site);      
    }*/
    
       
  /*  function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new SupplierCompanyFormatter($this):$this->formatter;
    }*/
    
    function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new EmployeeUser($this->get('employee_user_id')):$this->_employee_user_id;
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
             $this->i18n=new EmployeeContentI18n(array('lang'=>$lang,"content"=>$this));
         }   
         return $this->i18n;
     } 
     
     public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     }
     
     
    public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/employees/".$this->get('employee_user_id')."/contents/";
    }
      
       public function getPictureDirectory()
    {
        return $this->getDirectory()."/picture/";
    }
        
    
     function hasPicture()
    {    
        return (boolean)$this->get('picture');   
    }
    
     function getPicture()
    {    
        return $this->_picture=$this->_picture===null?new EmployeeContentPictureFrame($this):$this->_picture;   
    }
    
      function setPicture(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__picture=$file;       
        $this->set('picture',$file->getOriginalName());
        return $this;
    } 
    
    
     function save()
    {
         if ($this->hasPropertyChanged('picture') && $this->isLoaded() && $this->__picture)
        {                
            $this->getPicture()->removeAll();
        }       
        parent::save();
        if ($this->__picture)
        {                    
           $this->_picture=null;
           $this->__picture->save($this->getPicture()->getPath(),$this->get('picture'));  
           $this->getPicture()->generate();
           $this->__picture=null; 
        }               
        return $this;
    }
    
    function delete() {
        $this->getPicture()->delete();  
        return parent::delete();
    }
    
    
}
