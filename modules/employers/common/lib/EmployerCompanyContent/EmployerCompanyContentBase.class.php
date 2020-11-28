<?php 
    
class EmployerCompanyContentBase extends mfObject3 {
     
    protected static $fields=array('name','picture','template','company_id','created_at','updated_at');
    const table="t_employer_company_content"; 
    protected static $foreignKeys=array('company_id'=>'EmployerCompany'); // By default
    
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
         if ($parameters instanceof EmployerCompany)
             return $this->loadbyCompany($parameters);               
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);              
      }   
    }
    
    protected function loadByCompany(EmployerCompany $company)
    {    
         if ($company->isNotLoaded())
             return ;
         $this->set('company_id',$company);         
         $db=mfSiteDatabase::getInstance()->setParameters(array('company_id'=>$company->get('id')));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE company_id='{company_id}';")
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
    
    function getCompany()
    {
        return $this->_company_id=$this->_company_id===null?new SupplierCompany($this->get('company_id')):$this->_company_id;
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
             $this->i18n=new EmployerCompanyContentI18n(array('lang'=>$lang,"content"=>$this));
         }   
         return $this->i18n;
     } 
     
     public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     } 
}
