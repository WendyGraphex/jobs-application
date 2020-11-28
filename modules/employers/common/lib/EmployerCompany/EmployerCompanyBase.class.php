<?php


class EmployerCompanyBase extends mfObject3 {
     
    protected static $fields=array('name','url','commercial','email','web','fax','phone','activity_id',
                                   'coordinates','lat','lng','mobile','logo','number_of_adverts','registration',
                                   'address1','address2','postcode','city','country','state','number_of_users',
        'number_of_quotations','number_of_views','last_delivery','number_of_works_inprogress','number_of_works',
'average_response_time','average_notation','number_of_notations',
                                   'is_configured','is_completed','is_activated','is_validated','is_active', 
                                   'picture','status','created_at','updated_at');
    const table="t_employer_company"; 
    protected static $foreignKeys=array('city_id'=>'SiteCity','activity_id'=>'EmployerActivity'); // By default
    protected static $fieldsNull=array('updated_at','city_id','activity_id',); 
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);
             if (isset($parameters['url']))
              return $this->loadByUrl((string)$parameters['url']); 
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);    
         return $this->loadByName((string)$parameters);    
      }   
    }
    
    protected function loadByName($name)
    {    
         $this->set('name',$name);         
         $db=mfSiteDatabase::getInstance()->setParameters(array('name'=>$name));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE name='{name}';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);   
    }    
       
    
      protected function getDefaults()
      {
          $this->setIfNotNull(array(
              'created_at'=>date("Y-m-d H:i:s"),
              'updated_at'=>date("Y-m-d H:i:s"),             
              'status'=>"ACTIVE",
              'is_active'=>'YES',
              'is_configured'=>'NO',
              'is_completed'=>'NO',
              'is_activated'=>'NO',
              'is_validated'=>'NO',
          ));                      
      }
     
     
    function getValuesForUpdate()
    {
       $this->set('updated_at',date("Y-m-d H:i:s"));   
    }            
    
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' ".$key_condition)
        ->makeSqlQuery();  
    }
    
    function disable()
    {
        if ($this->isNotLoaded())
            return $this;
        $this->set('is_active','NO');
        $this->save();
    }
    
    function enable()
    {
        if ($this->isNotLoaded())
            return $this;
        $this->set('is_active','YES');
        $this->save();
    }
   
    function getUsers()
    {        
        if ($this->users===null)
        {
            $this->users=new EmployerUserCollection($this);
             if ($this->isNotLoaded())
                return $this->users;
            $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('company_id'=>$this->get('id')))
                    ->setQuery("SELECT *  FROM ".  EmployerUser::getTable().                           
                               " WHERE company_id={company_id}".                           
                               ";")               
                    ->makeSqlQuery();  
              if (!$db->getNumRows())
                return $this->users;   
            while ($item=$db->fetchObject('EmployerUser'))
            {                     
               $this->users[$item->get('id')]=$item->loaded();
            }
        }        
        return $this->users;
    }
    
    function hasUsers()
    {
        return $this->getUsers();
    }
  
    function hasFirstUser()
    {
        return $this->getFirstUser();
    }
    
    function getFirstUser()
    {
        if ($this->isNotLoaded())
            return null;
        if ($this->first_user===null)
        {
            $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('company_id'=>$this->get('id')))
                    ->setQuery("SELECT *  FROM ".  EmployerUser::getTable().                           
                               " WHERE company_id={company_id}".   
                               " ORDER BY id DESC ".
                               " LIMIT 0,1".
                               ";")               
                    ->makeSqlQuery();  
               if (!$db->getNumRows())                  
                   $this->first_user=false;
               else 
                    $this->first_user=$db->fetchObject('EmployerUser')->loaded();
        }
        return $this->first_user;
    }
    
    function toArray($fields=array())
    {
        $values=parent::toArray($fields);
        if ($this->hasFirstUser())
            $values['user']=$this->getFirstUser()->toArray(array('firstname','lastname','phone','mobile'));
        return $values;
    }
    
    function __toString()
    {
        return (string)$this->get('name');
    }
    
    function hasEmail()
    {
        return $this->get('email');
    }
    
   
    function toArrayForTransfer()
    {
        $values=array();
        foreach (array('name','siret','tva','email','web','fax','phone','coordinates','address1',
                       'address2','postcode','city','country','ape','mobile'
                      ) as $field)
        {        
            $values[$field]=$this->get($field);
        }            
        return $values;
    }
       
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new EmployerCompanyFormatter($this):$this->formatter;
    }
    
     function isActive()
    {
        return $this->get('is_active')=='YES';
    }
      /*   ===============================LOGO================================= */
    public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/employers/company/".$this->get('id')."/logo";
    }
    
    function hasLogo()
    {
        return (boolean)$this->get('logo');
    }
    
     function getLogo()
    {    
        return $this->_logo=$this->_logo===null?new EmployerLogoFrame($this):$this->_logo;   
    }
        
     function setLogoFile(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__logo=$file;       
        $this->set('logo','logo.'.$file->getExtension());
        return $this;
    }              
    
    /* =================================== P I C T U R E  =========================================== */
      
     public function getDirectoryPicture()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/employers/company/".$this->get('id')."/picture";
    }
    
     function hasPicture()
    {    
        return (boolean)$this->get('picture');   
    }
    
     function getPicture()
    {    
        return $this->_picture=$this->_picture===null?new EmployerPictureFrame($this):$this->_picture;   
    }
        
     function setPictureFile(mfValidatedFile $file)
    {           
        if ($file===null)
            return  $this;            
        $this->__picture=$file;       
        $this->set('picture','picture.'.$file->getExtension());                
        return $this;
    } 

    function generateUrl()
    {     
        $this->set('url',(string)$this->getFormatter()->getName()->noaccent()->lower());
        return $this;
    }
    
    function save()
    {      
      /*  if ($this->isLoaded() && $this->__logo)
        {                  
            $this->getLogo()->remove();
        }
        if ($this->isLoaded() && $this->__picture)
        {                  
            $this->getPicture()->remove();
        }*/
        if ($this->hasPropertyChanged('name') || $this->isNotLoaded())       
            $this->generateUrl();      
        parent::save();
        if ($this->__logo)
        {                       
           $this->_logo=null;
           $this->__logo->save($this->getLogo()->getPath(),$this->get('logo'));  
           $this->getLogo()->generate();
           $this->__logo=null; 
        }  
        if ($this->__picture)
        {                                
           $this->_picture=null;
           $this->__picture->save($this->getPicture()->getPath(),$this->get('picture'));    
           $this->getPicture()->generate();
           $this->__picture=null; 
        }  
        return $this;
    }
    
    function isConfigured()
    {
        return $this->get('is_configured')=='YES';
    }
    
    function isCompleted()
    {
        return $this->get('is_completed')=='YES';
    }
    
    function getNumberOfAdverts()
    {
          return intval($this->get('number_of_adverts')) ;
    }    
    
    function addNumberOfAdverts($value=1)
    {       
        $this->set('number_of_adverts',$this->getNumberOfAdverts() + $value)->save();
        return $this;
    }
    
     function getUrl($lang=null)
    {
         return link_i18n("employers_company",array('url'=>$this->get('url'),'id'=>$this->get('id')),$lang,'frontend'); 
    }       
    
    function getContents()
    {
        if ($this->contents===null)
         {    
            $this->contents=new EmployerCompanyContentI18nCollection();
            $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('company_id'=>$this->get('id')))
                    ->setQuery("SELECT ".EmployerCompanyContentI18n::getFieldsAndKeyWithTable()." FROM ".EmployerCompanyContentI18n::getTable().
                               " INNER JOIN ".EmployerCompanyContentI18n::getOuterForJoin('content_id').
                               " INNER JOIN ".Language::getTable()." ON ".Language::getTableField('code')."=".EmployerCompanyContentI18n::getTableField('lang').   
                               " WHERE company_id='{company_id}'".
                               " ORDER BY ".Language::getTableField('position')." ASC".
                               ";")
                    ->makeSqlQuery();
             if (!$db->getNumRows())
                return $this->contents;             
            while ($item=$db->fetchObject('EmployerCompanyContentI18n'))
            {
               $this->contents[]=$item->loaded();
            }             
       }
        return $this->contents;
    }
    
     function getContent()
    {    
        return $this->content=$this->content===null?new EmployerCompanyContent($this):$this->content;   
    }
    
    function incUser()
    {
        $this->set('number_of_users',$this->get('number_of_users') +1);
        return $this->save();
    }
    
    function decUser()
    {
        $this->set('number_of_users',$this->get('number_of_users') - 1);
        return $this->save();
    }
    
    function hasActivity()
    {
        return (boolean)$this->get('activity_id');
    }
    
     function getActivity()
    {    
        return $this->_activity_id=$this->_activity_id===null?new EmployerActivity($this->get('activity_id')):$this->_activity_id;   
    }
    
    
    function process()
    {
        $this->set('is_completed','YES');
        return $this;
    }
    
    
    function isOnline()
    {       
         if ($this->is_online===null)
         {
             $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('company_id'=>$this->get('id')))
                    ->setQuery("SELECT count(id)  FROM ".  EmployerUser::getTable().                           
                               " WHERE company_id={company_id} AND is_online='Y'".                           
                               ";")               
                    ->makeSqlQuery();  
             $row=$db->fetchRow();
             $this->is_online=intval($row[0]) > 0; 
         } 
         return $this->is_online;   
    }
}
