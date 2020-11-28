<?php

class EmployerUserBase extends mfObject3 {
     
    protected static $fields=array('company_id','url','password','gender','firstname','lastname','email','phone','mobile','fax','address1',
                                   'address2','avatar','postcode','city','country','is_admin','is_completed','web','number_of_adverts',
                                   'is_validated','type','is_locked','creator_id','username', 'default_language','state',
                                   'last_delivery','number_of_works_inprogress','number_of_works','average_response_time',
                                   'activity_id', 'number_of_views','number_of_quotations','number_of_notations',
                                   'average_notation','is_online','max_advert_category','function_id','ranking','instagram_user','linkedin_user',
                                   'lastlogin', 'lastpassword', 'is_active','status', 'created_at','updated_at');    
    const table="t_employer_user"; 
    protected static $fieldsNull=array('activity_id','company_id','birthday','lastpassword','function_id','lastlogin','updated_at','creator_id','average_notation','max_advert_category'); // By default);    
    protected static $foreignKeys=array('creator_id'=>'EmployerUser', 
                                     'activity_id'=>'EmployerActivity',
                                     'company_id'=>'EmployerCompany' ); // By default

    function __construct($parameters=null) {
        parent::__construct();   
        $this->getDefaults(); 
        if ($parameters === null)  return $this;      
        if (is_array($parameters)||$parameters instanceof ArrayAccess)
        {
            if (isset($parameters['id']))
               return $this->loadbyId((string)$parameters['id']);   
               if (isset($parameters['instagram_user']))
             return $this->loadbyInstagramUser($parameters['instagram_user']); 
                  if (isset($parameters['linkedin_user']))
             return $this->loadbyLinkedinUser($parameters['linkedin_user']); 
            if (isset($parameters['lastname']) && isset($parameters['firstname']))
               return $this->loadbyFirstNameAndLastname((string)$parameters['firstname'],(string)$parameters['lastname']); 
            if (isset($parameters['phone']))
               return $this->loadbyPhoneOrMobile((string)$parameters['phone']); 
            if (isset($parameters['username']))
                return $this->loadbyUsername($parameters['username']); 
            if (isset($parameters['email']))
                return $this->loadbyEmail($parameters['email']); 
            return $this->add($parameters); 
        } 
        else
        {         
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);
           return $this->loadByEmail((string)$parameters);
        } 
      }
      
         protected function loadByUsername($username)
      {                 
           $db=mfSiteDatabase::getInstance()->setParameters(array('username'=>$username));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE username='{username}';")
              ->makeSqlQuery();                           
           return $this->rowtoObject($db);
      }
      
       
          protected function loadByLinkedinUser($linkedin_user)
      {       
           $this->set('linkedin_user',$linkedin_user);
           $db=mfSiteDatabase::getInstance()->setParameters(array('linkedin_user'=>$linkedin_user));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE linkedin_user='{linkedin_user}';")
              ->makeSqlQuery();                           
           return $this->rowtoObject($db);
      }
      
       protected function loadByInstagramUser($instagram_user)
      {       
           $this->set('instagram_user',$instagram_user);
           $db=mfSiteDatabase::getInstance()->setParameters(array('instagram_user'=>$instagram_user));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE instagram_user='{instagram_user}';")
              ->makeSqlQuery();                           
           return $this->rowtoObject($db);
      }
      
       protected function loadByPhoneOrMobile($phone)
      {       
           $this->set('phone',$phone);
           $db=mfSiteDatabase::getInstance()->setParameters(array('phone'=>$phone));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE phone='{phone}' OR mobile='{phone}';")
              ->makeSqlQuery();                           
           return $this->rowtoObject($db);
      }
      
      protected function loadByFirstNameAndLastname($firstname,$lastname)
      {
           $this->set('firstname',$firstname);
           $this->set('lastname',$lastname);
           $db=mfSiteDatabase::getInstance()->setParameters(array('firstname'=>$firstname,'lastname'=>$lastname));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE firstname='{firstname}' AND lastname='{lastname}';")
              ->makeSqlQuery();                           
           return $this->rowtoObject($db);
      }
      
      protected function loadByEmail($email)
      {
           $this->set('email',$email);
           $db=mfSiteDatabase::getInstance()->setParameters(array($email));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE email='%s';")
              ->makeSqlQuery();  
          // echo $db->getQuery();
           return $this->rowtoObject($db);
      }
   
     
      protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
            'gender'=>"Mr",
            'is_admin'=>'NO',
            'is_active'=>"YES",
            'status'=>"ACTIVE",
            'is_validated'=>'NO',
            'type'=>'private',
            'is_completed'=>'NO',
            'is_locked'=>'NO',    
            'is_online'=>'N'
        ));      
    }
     
      function getValuesForUpdate()
      {
          $this->set('updated_at',date("Y-m-d H:i:s"));   
      }   
      
      
      protected function executeIsExistQuery($db)    
      {
         $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
        $db->setParameters(array('email'=>$this->get('email'),$this->getKey()))
           ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE email='{email}' ".$key_condition)
           ->makeSqlQuery();  
       
      }
          
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployerUserFormatter($this):$this->formatter;
   }
   
    function generateUrl()
    {       
        if (!$this->hasPropertyChanged('username') && $this->isLoaded())
            return $this;
        $this->set('url',(string)$this->getFormatter()->getUsername()->lower()->noaccent()->replace(" ",""));
        return $this;
    }
           
       /* ========================================= S E C U R I T Y  G U A R D  ======================================================================================= */

    function updateSession($user,$session_id,$ip=null)
    {               
         if ($this->isNotLoaded())
            return null;
        $session=new EmployerUserSession($session_id);
        $session->add(array("session"=>$session_id,
                        "ended_at"=>date('Y-m-d H:i:s'),                      
                        "user_id"=>$this));               
        if ($user->hasLocation())
            $session->setLocation($user->getLocation());
        if ($ip)
           $session->set("ip",$ip);
        $session->save();                
        return $session;
    }
        
    
    function updateRememberMe($ip)
    {
         if ($this->isNotLoaded())
            return null;                 
        // Cleanup en temps et user
        EmployerUserRemember::cleanup(date('Y-m-d H:i:s', time() - $this->getExpirationAge()), $this);       
        $remember=new EmployerUserRemember();
        $remember->add(array('user_id'=>$this,'ip'=>$ip,'expiration_time'=>time() + $this->getExpirationAge()));
        $remember->generateRandomKey();
        $remember->save();          
        return $remember;
    }
    
    function getCookieName()
    {
        return EmployerUserRemember::getCookieName();
    }
    
    function getSettings()
    {
        return $this->settings=$this->settings===null? new EmployerSettings():$this->settings;
    }
   
    function getExpirationAge()
    {      
        return $this->getSettings()->get('cookie_expiration_age',15 * 24 * 3600);  
    }
       	   
      public function __toString()
      {      
         return (string) $this->firstname.' '.$this->lastname;
      }
      
        function getGender()
    {
        return $this->get('gender');
    } 
    
      public function getName($ucfirst=true)
      {      
         if ($ucfirst)
              return ucfirst($this->firstname)." ".ucfirst($this->lastname);
          return $this->__toString();  
      }                   
      
     static function setPasswordEncrypted($password)
     {
         return md5($password);
     }
 
     function encryptPassword()
    {     
        if (($this->hasPropertyChanged('password') || $this->isNotLoaded()) && $this->get('password') )
        {         
            $this->set('clear_password',$this->get('password'));
            $this->set('password',self::setPasswordEncrypted($this->get('password')));            
            $this->set('lastpassword',date("Y-m-d H:i:s"));
        }    
        return $this;
    }
    
    function setPassword($password=null)
    {          
          $this->set('password',$password?$password:mfTools::generatePassword(8));
          $this->set('clear_password',$this->get('password'));        
    }
    
    function generatePassword()
    {
          $this->set('password',mfTools::generatePassword(8));
          $this->set('clear_password',$this->get('password'));
          $this->encryptPassword();
          $this->save();
    }
    
    
    function validate()
    {
        if ($this->isNotLoaded())
            return $this;
        $this->set('is_validated','YES');
        $this->save();
        return $this;
    }
        
     function isProfessional()
    {
        return $this->get('type')=='professional';
    }
    
    function isPrivate()
    {
        return $this->get('type')=='private';
    }
    
    function checkUnlock($password)
    {
        return $this->get('password')==self::setPasswordEncrypted($password);
    }
    
     function create()
    {            
        $this->set('is_admin','YES');
        $this->save();     
        if ($this->hasCompany())
            $this->getCompany()->incUser();
        return $this;
    }      
     
    function hasCompany()
    {
        return $this->get('company_id');
    }
    
    function getCompany()
    {
        return $this->_company_id=$this->_company_id===null?new EmployerCompany($this->get('company_id')):$this->_company_id;
    }
    
    function getCreator()
    {
        return $this->_creator_id=$this->_creator_id===null?new EmployerUser($this->get('creator_id')):$this->_creator_id;
    }
    
     function isAdmin()
    {
        return $this->get('is_admin')=='YES';
    }
    
    function hasFunction()
    {
        return (boolean)$this->get('function_id');
    }
     function getFunction()
    {
        return $this->_function_id=$this->_function_id===null?new EmployerFunction($this->get('function_id')):$this->_function_id;
    }
    
    /* =================================== P I C T U R E S =========================================== */
      
     public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/employers/".$this->get('id')."/avatar";
    }
    
     function hasAvatar()
    {    
        return (boolean)$this->get('avatar');   
    }
    function hasPhone()
    {    
        return (boolean)$this->get('phone');   
    }
    function hasMobile()
    {    
        return (boolean)$this->get('mobile');   
    }
     function hasEmail()
    {    
        return (boolean)$this->get('email');   
    }
     function hasAddress1()
    {    
        return (boolean)$this->get('address1');   
    }
     function hasCountry()
    {    
        return (boolean)$this->get('country');   
    }
     function hasUserName()
    {    
        return (boolean)$this->get('username');   
    }
    
    function hasBirthday()
    {    
        return (boolean)$this->get('birthday');   
    }
    
    function uploadAvatarFromUrl(mfPictureUrl $picture)
    {        
        $this->set('avatar','avatar.'.$picture->getExtension());  
        $this->save();
        if (!$picture->isValid())        
            return $this;      
        if ($this->getAvatar()->getOriginal()->load()->getSize() == $picture->getSize())
            return $this;               
        mfFileSystem::mkdirs($this->getAvatar()->getPath());               
        file_put_contents($this->getAvatar()->getPath()."/avatar.".$picture->getExtension(), $picture->getContent());       
        $this->getAvatar()->generate();         
        return  $this;           
    }
    
     function getAvatar()
    {    
        return $this->_avatar=$this->_avatar===null?new EmployerAvatarFrame($this):$this->_avatar;   
    }
        
     function setAvatarFile(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__avatar=$file;            
        $this->set('avatar','avatar.'.$file->getExtension());
        return $this;
    }      
    
   
    function save()
    {
         $this->encryptPassword();
         $this->generateUrl();
         if ($this->isLoaded() && $this->__avatar)
        {                
            $this->getAvatar()->removeAll();
        }
        parent::save();
        if ($this->__avatar)
        {                    
           $this->_avatar=null;         
           $this->__avatar->save($this->getAvatar()->getPath(),$this->get('avatar'));            
           $this->getAvatar()->generate();
           $this->__avatar=null; 
        }         
        return $this;
    }
    
    function delete() {
        $this->getAvatar()->delete();
        parent::delete();
        if ($this->hasCompany())
            $this->getCompany()->decUser();
    }
    
    
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
    
    function isValidated()
    {
        return $this->get('is_validated')=='YES';
    }
    
    function isCompleted()
    {
        return $this->get('is_completed')=='YES';
    }
    
   /* function isConfigured()
    {
        return $this->get('is_configured')=='YES';
    }*/
    
    function isLocked()
    {
        return $this->get('is_locked')=='YES';
    }
    
    function lock()
    {
        $this->set('is_locked','YES')->save();
        return $this;
    }
    
    function unlock()
    {
        $this->set('is_locked','NO')->save();
        return $this;
    }
    
    function enable()
    {
       $this->set('status','ACTIVE')->save();       
       if ($this->hasCompany())
            $this->getCompany()->incUser();
       return $this;
    }
    
    function disable()
    {
       $this->set('status','DELETE')->save();       
       if ($this->hasCompany())
            $this->getCompany()->decUser();
       return $this;
    }
    
    function getNumberOfAdverts()
    {
       return intval($this->get('number_of_adverts')) ;
    }
    
    function addNumberOfAdverts($value=1)
    {
        if ($this->hasCompany())      
           $this->getCompany()->addNumberOfAdverts($value);        
        $this->set('number_of_adverts',$this->getNumberOfAdverts() + $value)->save();
        return $this;
    }
    
     function getNumberOfQuotations()
    {
       return intval($this->get('number_of_quotations')) ;
    }
    
     function addNumberOfQuotations($value=1)
    {             
        $this->set('number_of_quotations',$this->getNumberOfQuotations() + $value)->save();
        return $this;
    }
    
     function getNumberOfViews()
    {
       return intval($this->get('number_of_views')) ;
    }
    
     function addNumberOfViews($value=1)
    {             
        $this->set('number_of_views',$this->getNumberOfViews() + $value)->save();
        return $this;
    }
    
    
    function isCreator()
    {
        return !(boolean)$this->get('creator_id');
    }
    
     function getUrl()
    {
          return url_i18n_to("employers_employer",array('url'=>$this->get('url')),$this->get('lang'),'frontend');     
    }
   
    
     function getEmployerCategories()
    {
        if ($this->employer_categories===null)
        {
            $this->employer_categories=new EmployerCategoryCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('employer_user_id'=>$this->get('id'),'lang'=>mfContext::getInstance()->getUser()->getLanguage())) 
                ->setObjects(array('EmployerCategory','PartnerWorkCategory','PartnerWorkCategoryI18n'))
                ->setQuery("SELECT {fields} FROM ".EmployerCategory::getTable(). 
                           " INNER JOIN ".EmployerCategory::getOuterForJoin('category_id').
                           " INNER JOIN ".PartnerWorkCategoryI18n::getInnerForJoin('category_id').
                           " WHERE ".EmployerCategory::getTableField('employer_user_id')."='{employer_user_id}' AND ".PartnerWorkCategoryI18n::getTableField('lang')."='{lang}'".
                           ";")               
                ->makeSqlQuery(); 
            if (!$db->getNumRows())
               return $this->employer_categories;
            while ($items=$db->fetchObjects())
            {                            
                $item=$items->getEmployerCategory();
                $item->set('category_id',$items->getPartnerWorkCategory());
                $item->getCategory()->setI18n($items->getPartnerWorkCategoryI18n());
                $this->employer_categories[$item->get('id')]=$item;
            } 
            $this->employer_categories->loaded();
        }   
        return $this->employer_categories;
    }      
    
     function updateCategories(PartnerWorkCategoryCollection $categories)
    {    
       $db=mfSiteDatabase::getInstance();
        if ($categories->isEmpty())
        {
            $db->setParameters(array('employer_user_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".EmployerCategory::getTable().                            
                           " WHERE ".EmployerCategory::getTableField('employer_user_id')."='{employer_user_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
            return $this;
        }             
        $db->setParameters(array('employer_user_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".EmployerCategory::getTable().                            
                           " WHERE ".EmployerCategory::getTableField('employer_user_id')."='{employer_user_id}' AND category_id NOT IN('".$categories->getKeys()->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
        $db->setParameters(array('employer_user_id'=>$this->get('id')))              
                ->setQuery("SELECT category_id FROM ".EmployerCategory::getTable().                            
                           " WHERE ".EmployerCategory::getTableField('employer_user_id')."='{employer_user_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {
             while ($row=$db->fetchRow())
            {        
                $categories->removeItemFromIndex($row[0]);                  
            }   
         }                     
         $employer_categories = new EmployerCategoryCollection();
         foreach ($categories as $category)
         {    
             $item= new EmployerCategory();
             $item->add(array('category_id'=>$category,'employer_user_id'=>$this));
             $employer_categories->push($item);
         }
         $employer_categories->save(); 
         $this->employer_categories=null;
         return $this;
    }
    
    
    function getContents()
    {
        if ($this->contents===null)
         {    
            $this->contents=new EmployerContentI18nCollection();
            $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('employer_user_id'=>$this->get('id')))
                    ->setQuery("SELECT ".EmployerContentI18n::getFieldsAndKeyWithTable()." FROM ".EmployerContentI18n::getTable().
                               " INNER JOIN ".EmployerContentI18n::getOuterForJoin('content_id').
                               " INNER JOIN ".Language::getTable()." ON ".Language::getTableField('code')."=".EmployerContentI18n::getTableField('lang').   
                               " WHERE employer_user_id='{employer_user_id}' AND ".Language::getTableField('is_active')."='YES' AND ".Language::getTableField('application')."='frontend'".
                               " ORDER BY ".Language::getTableField('position')." ASC".
                               ";")
                    ->makeSqlQuery();           
             if (!$db->getNumRows())
                return $this->contents;             
            while ($item=$db->fetchObject('EmployerContentI18n'))
            {
               $this->contents[]=$item->loaded();
            } 
            $this->contents->loaded();            
       }
        return $this->contents;
    }
    
    function hasContent()
    {
        return $this->content;
    }
    
    function getContent()
    {
        return $this->content=$this->content===null?new EmployerContent($this):$this->content;
    }
    
    function getNumberOfProjects()
    {
       // if ($this->number_of_projects===null)
       // {
            $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('employer_user_id'=>$this->get('id')))
                    ->setQuery("SELECT count(*) FROM ".EmployerProject::getTable().                              
                               " WHERE employer_user_id='{employer_user_id}' AND is_active='YES' AND status = 'ACTIVE' AND state!='UPLOAD'".                            
                               ";")
                    ->makeSqlQuery();
            $row=$db->fetchRow();
            $this->number_of_projects=intval($row[0]);
       // }    
        return $this->number_of_projects;
    }
    
        
    function getUserLanguages()
    {
        if ($this->user_languages ===null)
        {
            $this->user_languages = new EmployerUserLanguageCollection();
            $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('employer_user_id'=>$this->get('id'),'lang'=> mfcontext::getInstance()->getUser()->getLanguage()))
                    ->setObjects(array('EmployerUserLanguage','EmployerLanguageLevel','EmployerLanguageLevelI18n'))
                    ->setQuery("SELECT {fields} FROM ".EmployerUserLanguage::getTable().  
                               " LEFT JOIN ".EmployerUserLanguage::getOuterForJoin('level_id').  
                               " LEFT JOIN ".EmployerLanguageLevelI18n::getInnerForJoin('level_id')." AND ".EmployerLanguageLevelI18n::getTableField('lang')."='{lang}'".
                               " WHERE employer_user_id='{employer_user_id}'".  
                               " ORDER BY ".EmployerUserLanguage::getTableField('position')." ASC ".
                               ";")
                    ->makeSqlQuery();
           // echo $db->getQuery();
            if (!$db->getNumRows())
                return $this->user_languages;         
            while ($items=$db->fetchObjects())
            {
               $item=$items->getEmployerUserLanguage();
               $item->set('level_id',$items->hasEmployerLanguageLevel()?$items->getEmployerLanguageLevel():false);
               if ($item->hasLevel())              
                  $item->getLevel()->setI18n($items->hasEmployerLanguageLevelI18n()?$items->getEmployerLanguageLevelI18n():false);             
               $this->user_languages[]=$item;
            }              
        }   
        return $this->user_languages;
    }
    
     function updateUserLanguages(mfArray $user_languages)
     {
         //var_dump($user_languages);
         if( $user_languages->isEmpty())
             return $this;
          $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('employer_user_id'=>$this->get('id')))
                    ->setQuery("DELETE FROM ".EmployerUserLanguage::getTable().                            
                               " WHERE employer_user_id='{employer_user_id}'".                               
                               ";")
                    ->makeSqlQuery();
         $this->user_languages = new EmployerUserLanguageCollection();
         foreach ($user_languages as $index=>$user_language)
         {
             $item=new EmployerUserLanguage();
             $item->set('employer_user_id',$this);
             $item->set('position',$index+1);
             $item->add($user_language);
             $this->user_languages[]=$item;
         }    
         $this->user_languages->save();
         return $this;
     }
     
     
     function isProfileCompleted()
     {
         if ($this->isProfessional())
            return $this->isCompleted() && $this->getCompany()->isCompleted();
         return $this->isCompleted();
     }
     
     function process()
     {
         $this->set('is_completed','YES');
         return $this;
     }
     
     function hasActivity()
     {
         return (boolean)$this->get('activity_id');
     }
        function getActivity()
    {    
        return $this->_activity_id=$this->_activity_id===null?new EmployerActivity($this->get('activity_id')):$this->_activity_id;   
    }
    
    
    function hasDefaultLanguage()
    {
        return (boolean)$this->get('default_language');
    }
    
     function isOnline()
     {
         return $this->get('is_online')=='Y';
     }
     
      function getNumberOfNotations()
      {
          return intval($this->get('number_of_notations'));
      }
      
       function isFromInstagram()
     {
         return $this->get('instagram_user')!='';
     }
     
      function isFromlinkedin()
     {
         return $this->get('linkedin_user')!='';
     }
}