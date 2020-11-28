<?php

 
class EmployeeBase extends mfObject3 {
     
    protected static $fields=array('url','gender','firstname','lastname','birthday','email','phone','mobile','is_active',
                                    'fax','web','address1','address2','avatar','postcode','city','country','status', 'experience_id',
                                    'default_language','last_delivery','number_of_works_inprogress','number_of_works','average_response_time',
                                   'is_validated','is_completed','is_locked','number_of_adverts','creator_id','username','level_id',
                                   'number_of_views','number_of_quotations','function_id','number_of_notations',
                                   'average_notation','is_online','max_advert_category','ranking','instagram_user','state','linkedin_user',
                                    'password','created_at','updated_at');    
    const table="t_employee_user"; 
    protected static $fieldsNull=array('updated_at','birthday','creator_id','function_id','experience_id','average_notation','max_advert_category','level_id'); // By default
    protected static $foreignKeys=array('creator_id'=>'Employee',
                                        'level_id'=>'EmployeeStudyLevel',
                                        'experience_id'=>'EmployeeExperience',); // By default

    function __construct($parameters=null) {                  
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {                  
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);            
          if (isset($parameters['lastname']) && isset($parameters['firstname']))
             return $this->loadbyFirstNameAndLastName((string)$parameters['firstname'],(string)$parameters['lastname']); 
          if (isset($parameters['instagram_user']))
             return $this->loadbyInstagramUser($parameters['instagram_user']); 
         if (isset($parameters['linkedin_user']))
             return $this->loadbyLinkedinUser($parameters['linkedin_user']); 
           if (isset($parameters['username']))
             return $this->loadbyUsername($parameters['username']); 
          if (isset($parameters['phone']))
             return $this->loadbyPhoneOrMobile((string)$parameters['phone']); 
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
    
     protected function loadByInstagramUser($instagram_user)
      {       
           $this->set('instagram_user',$instagram_user);
           $db=mfSiteDatabase::getInstance()->setParameters(array('instagram_user'=>$instagram_user));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE instagram_user='{instagram_user}';")
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
      
       protected function loadByUsername($username)
      {                 
           $db=mfSiteDatabase::getInstance()->setParameters(array('username'=>$username));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE username='{username}';")
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
      
      protected function loadByFirstNameAndLastName($firstname,$lastname)
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
           return $this->rowtoObject($db);
      }       
      
       protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
            'gender'=>"Mr",          
            'is_active'=>"YES",
            'status'=>"ACTIVE",
            'is_validated'=>'NO',            
            'is_completed'=>'NO',
            'is_configured'=>'NO',
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
          
      /* =================================== P I C T U R E S =========================================== */
      
      public function getDirectory()
      {
          return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/employees/".$this->get('id')."/avatar";
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
    
     function getAvatar()
    {    
        return $this->_avatar=$this->_avatar===null?new EmployeeAvatarFrame($this):$this->_avatar;   
    }
      
     function uploadAvatarFromUrl(mfPictureUrl $picture)
    {        
        $this->set('avatar','avatar.'.$picture->getExtension());  
        $this->save();
        if (!$picture->isValid())        
            return $this;      
      //  if ($this->getAvatar()->getOriginal()->load()->getSize() == $picture->getSize())
      //      return $this;               
        mfFileSystem::mkdirs($this->getAvatar()->getPath());               
        file_put_contents($this->getAvatar()->getPath()."/avatar.".$picture->getExtension(), $picture->getContent());                       
        $this->getAvatar()->generate(); 
        
        return  $this;    
       
    }
    
     function setAvatarFile(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__avatar=$file;       
        $this->set('avatar','avatar.'.$file->getExtension());
        return $this;
    }            
    
    function delete() {
        $this->getAvatar()->delete();
        return parent::delete();
    }
      
      /* ============================================================================================================== */
      
       function isActive()
    {
        return $this->get('is_active')=='YES';
    }
     function isValidate()
    {
        return $this->get('is_validated')=='YES';
    }
     function isCompleted()
    {
        return $this->get('is_completed')=='YES';
    }
    
     function isConfigured()
    {
        return $this->get('is_configured')=='YES';
    }
  
      function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeFormatter($this):$this->formatter;
   }
   
    function getCreator()
    {
        return $this->_creator_id=$this->_creator_id===null?new Employee($this->get('creator_id')):$this->_creator_id;
    }
    
    function hasExperience()
    {
       return (boolean) $this->get('experience_id');
    }
    
     function getExperience()
    {
        return $this->_experience_id=$this->_experience_id===null?new EmployeeExperience($this->get('experience_id')):$this->_experience_id;
    }
    
    function hasFunction()
    {
        return (boolean)$this->get('function_id');
    }
     function getFunction()
    {
        return $this->_function_id=$this->_function_id===null?new EmployeeFunction($this->get('function_id')):$this->_function_id;
    }
            
    /* ========================================= S E C U R I T Y  G U A R D  ======================================================================================= */

    function updateSession($user,$session_id,$ip=null)
    {
         if ($this->isNotLoaded())
            return null;
        $session=new EmployeeSession($session_id);
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
        EmployeeRemember::cleanup(date('Y-m-d H:i:s', time() - $this->getExpirationAge()), $this);       
        $remember=new EmployeeRemember();
        $remember->add(array('user_id'=>$this,'ip'=>$ip,'expiration_time'=>time() + $this->getExpirationAge()));
        $remember->generateRandomKey();
        $remember->save();          
        return $remember;
    }
        
    
    function getCookieName()
    {
        return EmployeeRemember::getCookieName();
    }
    
    function getSettings()
    {
        return $this->settings=$this->settings===null? new EmployeeSettings():$this->settings;
    }
   
    function getExpirationAge()
    {      
        return $this->getSettings()->get('cookie_expiration_age',15 * 24 * 3600);  
    }
       	   
     /* ===END====================================== S E C U R I T Y  G U A R D  ======================================================================================= */

     
      public function __toString()
      {      
         return (string)ucfirst($this->get('firstname'))." ".ucfirst($this->get('lastname'));
      }
      
     static function setPasswordEncrypted($password)
     {
         return md5($password);
     }
 
     function encryptPassword()
    {           
        if (($this->hasPropertyChanged('password') || $this->isNotLoaded()) && trim($this->get('password')) )
        {         
            $this->set('clear_password',$this->get('password'));
            $this->set('password',self::setPasswordEncrypted($this->get('password')));            
            $this->set('lastpassword',date("Y-m-d H:i:s"));
        }    
        return $this;
    }
    
    function generatePassword()
    {
          $this->set('password',mfTools::generatePassword(8));
          $this->set('clear_password',$this->get('password'));
          $this->encryptPassword();
          $this->save();
    }
    
    function generateUrl()
    {
         if (!$this->hasPropertyChanged('username') && $this->isLoaded())
            return $this;
        $this->set('url',(string)$this->getFormatter()->getUsername()->lower()->noaccent()->replace(" ",""));
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
        
    
    function validate()
    {
        $this->set('is_validated','YES');
        $this->save();
        return $this;
    }
        
//    function isCompleted()
//    {
//        return $this->get('is_completed')=='YES';
//    }
    
    function checkUnlock($password)
    {
        return $this->get('password')==self::setPasswordEncrypted($password);
    }

    function create()
    {           
        $this->save();
        return $this;
    }
    
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
    
    function getGender()
    {
        return $this->get('gender');
    }
    
    function getNumberOfAdverts()
    {
       return intval($this->get('number_of_adverts')) ;
    }
    
    function addNumberOfAdverts($value=1)
    {
       // if ($this->hasCompany())      
      //     $this->getCompany()->addNumberOfAdverts($value);        
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
    
     function getUrl()
    {
          return url_i18n_to("employees_employee",array('url'=>$this->get('url')),$this->get('lang'),'frontend');     
    }
    
    
    
     function getEmployeeCategories()
    {
        if ($this->employee_categories===null)
        {
            $this->employee_categories=new EmployeeCategoryCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('employee_user_id'=>$this->get('id'),'lang'=>mfContext::getInstance()->getUser()->getLanguage())) 
                ->setObjects(array('EmployeeCategory','PartnerWorkCategory','PartnerWorkCategoryI18n'))
                ->setQuery("SELECT {fields} FROM ".EmployeeCategory::getTable(). 
                           " INNER JOIN ".EmployeeCategory::getOuterForJoin('category_id').
                           " INNER JOIN ".PartnerWorkCategoryI18n::getInnerForJoin('category_id').
                           " WHERE ".EmployeeCategory::getTableField('employee_user_id')."='{employee_user_id}' AND ".PartnerWorkCategoryI18n::getTableField('lang')."='{lang}'".
                           ";")               
                ->makeSqlQuery(); 
            if (!$db->getNumRows())
               return $this->employee_categories;
            while ($items=$db->fetchObjects())
            {                            
                $item=$items->getEmployeeCategory();
                $item->set('category_id',$items->getPartnerWorkCategory());
                $item->getCategory()->setI18n($items->getPartnerWorkCategoryI18n());
                $this->employee_categories[$item->get('id')]=$item;
            } 
            $this->employee_categories->loaded();
        }   
        return $this->employee_categories;
    }      
    
     function updateCategories(PartnerWorkCategoryCollection $categories)
    {    
       $db=mfSiteDatabase::getInstance();
        if ($categories->isEmpty())
        {
            $db->setParameters(array('employee_user_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".EmployeeCategory::getTable().                            
                           " WHERE ".EmployeeCategory::getTableField('employee_user_id')."='{employee_user_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
            return $this;
        }             
        $db->setParameters(array('employee_user_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".EmployeeCategory::getTable().                            
                           " WHERE ".EmployeeCategory::getTableField('employee_user_id')."='{employee_user_id}' AND category_id NOT IN('".$categories->getKeys()->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
        $db->setParameters(array('employee_user_id'=>$this->get('id')))              
                ->setQuery("SELECT category_id FROM ".EmployeeCategory::getTable().                            
                           " WHERE ".EmployeeCategory::getTableField('employee_user_id')."='{employee_user_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {
             while ($row=$db->fetchRow())
            {        
                $categories->removeItemFromIndex($row[0]);                  
            }   
         }                     
         $employee_categories = new EmployeeCategoryCollection();
         foreach ($categories as $category)
         {    
             $item= new EmployeeCategory();
             $item->add(array('category_id'=>$category,'employee_user_id'=>$this));
             $employee_categories->push($item);
         }
         $employee_categories->save(); 
         $this->employee_categories=null;
         return $this;
    }
    
    function getContents()
    {
        if ($this->contents===null)
         {    
            $this->contents=new EmployeeContentI18nCollection();
            $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('employee_user_id'=>$this->get('id')))
                    ->setQuery("SELECT ".EmployeeContentI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeContentI18n::getTable().
                               " INNER JOIN ".EmployeeContentI18n::getOuterForJoin('content_id').
                               " INNER JOIN ".Language::getTable()." ON ".Language::getTableField('code')."=".EmployeeContentI18n::getTableField('lang').   
                               " WHERE employee_user_id='{employee_user_id}'  AND ".Language::getTableField('is_active')."='YES' AND ".Language::getTableField('application')."='frontend'".
                               " ORDER BY ".Language::getTableField('position')." ASC".
                               ";")
                    ->makeSqlQuery();
             if (!$db->getNumRows())
                return $this->contents;             
            while ($item=$db->fetchObject('EmployeeContentI18n'))
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
        return $this->content=$this->content===null?new EmployeeContent($this):$this->content;
    }
    
    
     function getUserLanguages()
    {
        if ($this->user_languages ===null)
        {
            $this->user_languages = new EmployeeUserLanguageCollection();
            $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('employee_user_id'=>$this->get('id'),'lang'=> mfcontext::getInstance()->getUser()->getLanguage()))
                    ->setObjects(array('EmployeeUserLanguage','EmployeeLanguageLevel','EmployeeLanguageLevelI18n'))
                    ->setQuery("SELECT {fields} FROM ".EmployeeUserLanguage::getTable().  
                               " LEFT JOIN ".EmployeeUserLanguage::getOuterForJoin('level_id').  
                               " LEFT JOIN ".EmployeeLanguageLevelI18n::getInnerForJoin('level_id')." AND ".EmployeeLanguageLevelI18n::getTableField('lang')."='{lang}'".
                               " WHERE employee_user_id='{employee_user_id}'".  
                               " ORDER BY ".EmployeeUserLanguage::getTableField('position')." ASC ".
                               ";")
                    ->makeSqlQuery();
            // echo $db->getQuery();
            if (!$db->getNumRows())
                return $this->user_languages;         
            while ($items=$db->fetchObjects())
            {
               $item=$items->getEmployeeUserLanguage();
               $item->set('level_id',$items->hasEmployeeLanguageLevel()?$items->getEmployeeLanguageLevel():false);
               if ($item->hasLevel())              
                  $item->getLevel()->setI18n($items->hasEmployeeLanguageLevelI18n()?$items->getEmployeeLanguageLevelI18n():false);             
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
                    ->setParameters(array('employee_user_id'=>$this->get('id')))
                    ->setQuery("DELETE FROM ".EmployeeUserLanguage::getTable().                            
                               " WHERE employee_user_id='{employee_user_id}'".                               
                               ";")
                    ->makeSqlQuery();
         $this->user_languages = new EmployeeUserLanguageCollection();
         foreach ($user_languages as $index=>$user_language)
         {
             $item=new EmployeeUserLanguage();
             $item->set('employee_user_id',$this);
             $item->set('position',$index+1);
             $item->add($user_language);
             $this->user_languages[]=$item;
         }    
         $this->user_languages->save();
         return $this;
     }
     
     
     function getUserSkills()
    {
        if ($this->user_skills ===null)
        {
            $this->user_skills = new EmployeeUserSkillCollection();         
            $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('employee_user_id'=>$this->get('id'),'lang'=>mfContext::getInstance()->getUser()->getLanguage()))
                    ->setObjects(array('EmployeeUserSkill','EmployeeUserSkillI18n','EmployeeSkill','EmployeeSkillI18n'))
                    ->setQuery("SELECT {fields} FROM ".EmployeeUserSkill::getTable().   
                               " INNER JOIN ".EmployeeUserSkill::getOuterForJoin('skill_id').
                               " LEFT JOIN ".EmployeeUserSkillI18n::getInnerForJoin('skill_id').                              
                               " LEFT JOIN ".EmployeeSkillI18n::getInnerForJoin('skill_id')." AND ".EmployeeSkillI18n::getTableField('lang')."='{lang}'".
                               " WHERE employee_user_id='{employee_user_id}'".  
                               " ORDER BY ".EmployeeUserSkill::getTableField('position')." ASC ".
                               ";")
                    ->makeSqlQuery();
           //  echo $db->getQuery();
            if (!$db->getNumRows())
                return $this->user_skills;         
            while ($items=$db->fetchObjects())
            {
               $item=$items->getEmployeeUserSkill();
               if (!isset($this->user_skills[$item->get('id')])) 
                   $this->user_skills[$item->get('id')]=$item;
               $item->set('skill_id',$items->getEmployeeSkill());
               $item->getSkill()->setI18n($items->hasEmployeeSkillI18n()?$items->getEmployeeSkillI18n():false);
               if ($items->hasEmployeeUserSkillI18n())
               {    
                   $this->user_skills[$item->get('id')]->getI18ns()->push($items->getEmployeeUserSkillI18n());
                   if ($items->getEmployeeUserSkillI18n()->get('lang')==mfContext::getInstance()->getUser()->getLanguage())
                       $this->user_skills[$item->get('id')]->setI18n($items->getEmployeeUserSkillI18n());
               }
            }    
        }          
        return $this->user_skills;
    }
    
     function updateUserSkills(mfArray $user_skills)
     {
        //  echo "<pre>"; var_dump($user_skills); return $this;
         if( $user_skills->isEmpty())
             return $this;
          $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('employee_user_id'=>$this->get('id')))
                    ->setQuery("DELETE FROM ".EmployeeUserSkill::getTable().                            
                               " WHERE employee_user_id='{employee_user_id}'".                               
                               ";")
                    ->makeSqlQuery();
         $this->user_skills = new EmployeeUserSkillCollection();
          foreach ($user_skills as $index=>$user_skill)
         {
             $item=new EmployeeUserSkill();
             $item->set('employee_user_id',$this);
             $item->set('position',$index+1);
             $item->add($user_skill);
             $this->user_skills[]=$item;
         }                                        
         $this->user_skills->save(); 
         
         $i18n_collection = new EmployeeUserSkillI18nCollection();
         foreach ($this->user_skills as $index=>$user_skill)
         {
             foreach ($user_skills[$index]['i18n'] as $values)
             {
                  $item=new EmployeeUserSkillI18n();
                  $item->set('skill_id',$user_skill);
                  $item->add($values);                               
                  $i18n_collection[]=$item;
                  $user_skill->getI18ns()->push($item);
             }    
         } 
         $i18n_collection->save();
                 
         return $this;
     }
     
     
     function getUserDiplomas()
    {
        if ($this->user_diplomas ===null)
        {
            $this->user_diplomas = new EmployeeUserGraduateDiplomaCollection();         
            $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('employee_user_id'=>$this->get('id'),'lang'=>mfContext::getInstance()->getUser()->getLanguage()))
                    ->setObjects(array('EmployeeUserGraduateDiploma','EmployeeUserGraduateDiplomaI18n','EmployeeGraduateDiploma','EmployeeGraduateDiplomaI18n' ))
                    ->setQuery("SELECT {fields} FROM ".EmployeeUserGraduateDiploma::getTable().   
                               " INNER JOIN ".EmployeeUserGraduateDiploma::getOuterForJoin('graduate_id').                 
                               " INNER JOIN ".EmployeeUserGraduateDiplomaI18n::getInnerForJoin('user_graduate_id').                                         
                               " LEFT JOIN ".EmployeeGraduateDiplomaI18n::getInnerForJoin('graduate_id')." AND ".EmployeeGraduateDiplomaI18n::getTableField('lang')."='{lang}'".
                               " WHERE employee_user_id='{employee_user_id}'".  
                               " ORDER BY year DESC ".
                               ";")
                    ->makeSqlQuery();
          //  echo $db->getQuery();
            if (!$db->getNumRows())
                return $this->user_diplomas;         
            while ($items=$db->fetchObjects())
            {
               $item=$items->getEmployeeUserGraduateDiploma();
               if (!isset($this->user_diplomas[$item->get('id')])) 
                   $this->user_diplomas[$item->get('id')]=$item;
               $item->set('graduate_id',$items->getEmployeeGraduateDiploma());
               $item->getGraduate()->setI18n($items->hasEmployeeGraduateDiplomaI18n()?$items->getEmployeeGraduateDiplomaI18n():false);
               $this->user_diplomas[$item->get('id')]->getI18ns()->push($items->getEmployeeUserGraduateDiplomaI18n());                                         
               if ($items->getEmployeeUserGraduateDiplomaI18n()->get('lang')==mfContext::getInstance()->getUser()->getLanguage())
               {    
                     $this->user_diplomas[$item->get('id')]->setI18n($items->getEmployeeUserGraduateDiplomaI18n());      
               }
            }    
        }          
         return $this->user_diplomas;
    }
     
     function updateUserDiplomas(mfArray $user_diplomas)
     {
        // var_dump($user_diplomas);
         if( $user_diplomas->isEmpty())
             return $this;
       $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('employee_user_id'=>$this->get('id')))
                    ->setQuery("DELETE FROM ".EmployeeUserGraduateDiploma::getTable().                            
                               " WHERE employee_user_id='{employee_user_id}'".                               
                               ";")
                    ->makeSqlQuery();
         $this->user_diplomas = new EmployeeUserGraduateDiplomaCollection();
          foreach ($user_diplomas as $index=>$user_diploma)
         {
             $item=new EmployeeUserGraduateDiploma();
             $item->set('employee_user_id',$this);
             $item->set('position',$index+1);
             $item->add($user_diploma);
             $this->user_diplomas[]=$item;
         }                                        
         $this->user_diplomas->save(); 
         
         $i18n_collection = new EmployeeUserGraduateDiplomaI18nCollection();
         foreach ($this->user_diplomas as $index=>$user_diploma)
         {
             foreach ($user_diplomas[$index]['i18n'] as $values)
             {
                  $item=new EmployeeUserGraduateDiplomaI18n();
                  $item->set('user_graduate_id',$user_diploma);
                  $item->add($values);                               
                  $i18n_collection[]=$item;
                  $user_diploma->getI18ns()->push($item);
             }    
         } 
         $i18n_collection->save();        
       return $this;
     }
     
     
     
     function isProfileCompleted()
     {
         return $this->isCompleted();
     }
     
     function process()
     {
         $this->set('is_completed','YES');
         return $this;
     }
     
     
     function isOnline()
     {
         return $this->get('is_online')=='Y';
     }
     
      function getNumberOfNotations()
      {
          return intval($this->get('number_of_notations'));
      }
      
      
      function getPortofolioUrl()
      {          
         return url_i18n_to("employers_portfolio_page",array('url'=>$this->get('url')),$this->get('lang'),'frontend');     
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