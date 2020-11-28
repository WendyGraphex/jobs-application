<?php

class SiteEventUserBase extends mfObject3 {
     
    protected static $fields=array( 'password','gender','firstname','lastname','email','phone','mobile','fax','address1',
                                   'address2','avatar','postcode','city','country','is_completed','web',
                                   'is_validated','is_locked','username',  'instagram_user', 'linkedin_user',                  
                                   'lastlogin', 'lastpassword', 'is_active','status', 'created_at','updated_at');    
    const table="t_site_event_user"; 
    protected static $fieldsNull=array('birthday','lastpassword','lastlogin','updated_at');  
    protected static $foreignKeys=array();  

    function __construct($parameters=null) {
        parent::__construct();   
        $this->getDefaults(); 
        if ($parameters === null)  return $this;      
        if (is_array($parameters)||$parameters instanceof ArrayAccess)
        {
            if (isset($parameters['id']))
               return $this->loadbyId((string)$parameters['id']);    
               if (isset($parameters['instagram_user']))
              if (isset($parameters['linkedin_user']))
             return $this->loadbyLinkedinUser($parameters['linkedin_user']); 
             return $this->loadbyInstagramUser($parameters['instagram_user']); 
            if (isset($parameters['lastname']) && isset($parameters['firstname']))
               return $this->loadbyFirstNameAndLastname((string)$parameters['firstname'],(string)$parameters['lastname']); 
            if (isset($parameters['phone']))
               return $this->loadbyPhoneOrMobile((string)$parameters['phone']); 
            return $this->add($parameters); 
        } 
        else
        {         
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);
           return $this->loadByEmail((string)$parameters);
        } 
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
            'is_locked'=>'NO',              
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
       return $this->formatter=$this->formatter===null?new SiteEventUserFormatter($this):$this->formatter;
   }
   
   
           
       /* ========================================= S E C U R I T Y  G U A R D  ======================================================================================= */

    function updateSession($user,$session_id,$ip=null)
    {               
         if ($this->isNotLoaded())
            return null;
        $session=new SiteEventUserSession($session_id);
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
        SiteEventUserRemember::cleanup(date('Y-m-d H:i:s', time() - $this->getExpirationAge()), $this);       
        $remember=new SiteEventUserRemember();
        $remember->add(array('user_id'=>$this,'ip'=>$ip,'expiration_time'=>time() + $this->getExpirationAge()));
        $remember->generateRandomKey();
        $remember->save();          
        return $remember;
    }
    
    function getCookieName()
    {
        return SiteEventUserRemember::getCookieName();
    }
    
    function getSettings()
    {
        return $this->settings=$this->settings===null? new SiteEventSettings():$this->settings;
    }
   
    function getExpirationAge()
    {      
        return $this->getSettings()->get('cookie_expiration_age',15 * 24 * 3600);  
    }
       	   
      public function __toString()
      {      
         return (string) $this->firstname.' '.$this->lastname;
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
    
   
    /* =================================== P I C T U R E S =========================================== */
      
     public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/events/users/".$this->get('id')."/avatar";
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
        return $this->_avatar=$this->_avatar===null?new SiteEventUserAvatarFrame($this):$this->_avatar;   
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
      
       function checkUnlock($password)
    {
        return $this->get('password')==self::setPasswordEncrypted($password);
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
    
    function enable()
    {
       $this->set('status','ACTIVE')->save();             
       return $this;
    }
    
    function disable()
    {
       $this->set('status','DELETE')->save();           
       return $this;
    }
    
       function validate()
    {
        $this->set('is_validated','YES');
        $this->save();
        return $this;
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