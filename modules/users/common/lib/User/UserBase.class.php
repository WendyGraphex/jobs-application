<?php


class UserBase extends mfObject2 {
     
    protected static $fields=array('firstname','lastname','email','password','lastlogin','last_password_gen','username', 
                                   'mobile','fax','is_sponsor', //'instagram_user',
                                   'accept_newsletter','physician_number','website',
                                   'profession_id','specialty_id','sponsor_id','content_group_id',
                                   'application','is_active','is_guess','created_at','updated_at','picture','sex','email_tosend');
    const table="t_users";
    protected static $fieldsNull=array('last_password_gen','lastlogin','specialty_id','profession_id','content_group_id');
     protected static $foreignKeys=array('profession_id'=>'UserProfession',
                                        'specialty_id'=>'UserSpeciality',
                                        'sponsor_id',
                                        'content_group_id'=>'ContentGroup'
                                        ); // By default
    public $permissions=array(),$permission_names=array(),$groups=array();
   
    function __construct($parameters=null,$application=null) {
      parent::__construct($application);
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          // Import
          if (isset($parameters['username']) || (isset($parameters['firstname']) && isset($parameters['lastname'])))
              return $this->loadByUsernameOrFirstNameAndLastname((string)$parameters['username'],(string)$parameters['firstname'],(string)$parameters['firstname'],(string)$parameters['lastname']);
          if (isset($parameters['firstname']) && isset($parameters['lastname']))
              return $this->loadByFirstnameAndLastname((string)$parameters['firstname'],(string)$parameters['lastname']);
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         return $this->loadByEmail((string)$parameters);
      }   
    }
    
     protected function loadByUsernameOrFirstNameAndLastname($username,$firstname,$lastname)
    {
         if ($username=='')
             return $this->loadByFirstnameAndLastname($firstname,$lastname);
         $this->set('firstname',$firstname);
         $this->set('lastname',$lastname);
         $this->set('username',$username);
         $db=mfSiteDatabase::getInstance()->setParameters(array('firstname'=>$firstname,'lastname'=>$lastname,'username'=>$username));
         $db->setQuery("SELECT * FROM ".self::getTable().
                       " WHERE (firstname='{firstname}' AND lastname='{lastname}') OR username='{username}'".
                        " AND application@@IN_APPLICATION@@;");
          if ($this->isSuperAdministrator())
            $db->makeSqlQuerySuperAdmin($this->application); 
         else
            $db->makeSqlQuery($this->application,$this->site);                              
         return $this->rowtoObject($db);
    }
    
     protected function loadByFirstnameAndLastname($firstname,$lastname)
    {
         $this->set('firstname',$firstname);
         $this->set('lastname',$lastname);
         $db=mfSiteDatabase::getInstance()->setParameters(array('firstname'=>$firstname,'lastname'=>$lastname));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE firstname='{firstname}' AND lastname='{lastname}' AND application@@IN_APPLICATION@@;");
          if ($this->isSuperAdministrator())
            $db->makeSqlQuerySuperAdmin($this->application); 
         else
            $db->makeSqlQuery($this->application,$this->site); 
         //   ->makeSqlQuery($this->application,$this->site);                           
         return $this->rowtoObject($db);
    }
    
    protected function loadByEmail($email)
    {
         $this->set('email',$email);
         $db=mfSiteDatabase::getInstance()->setParameters(array($email));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE email='%s' AND application@@IN_APPLICATION@@;");
          if ($this->isSuperAdministrator())
            $db->makeSqlQuerySuperAdmin($this->application); 
         else
            $db->makeSqlQuery($this->application,$this->site); 
         //   ->makeSqlQuery($this->application,$this->site);                           
         return $this->rowtoObject($db);
    }
    
    protected function executeLoadById($db)
    {       
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d AND application@@IN_APPLICATION@@;");
         if ($this->isSuperAdministrator())
            $db->makeSqlQuerySuperAdmin($this->application); 
         else
            $db->makeSqlQuery($this->application,$this->site); 
        //    ->makeSqlQuery($this->application,$this->site);         
    }
    
    protected function getDefaults()
    {
       $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
       $this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");
       $this->email_tosend=isset($this->email_tosend)?$this->email_tosend:"NO";
       $this->is_active=isset($this->is_active)?$this->is_active:"NO";
       $this->is_guess=isset($this->is_guess)?$this->is_guess:"NO";
       $this->is_sponsor=isset($this->is_sponsor)?$this->is_sponsor:"NO";
       $this->sex=isset($this->sex)?$this->sex:"Mr";
       $this->last_password_gen=isset($this->last_password_gen)?$this->last_password_gen:null;
       $this->lastlogin=isset($this->lastlogin)?$this->lastlogin:null;
    }
     
    protected function executeInsertQuery($db)
    {
      // $db->makeSqlQuery($this->application,$this->site); 
         if ($this->isSuperAdministrator())
            $db->makeSqlQuerySuperAdmin($this->application); 
         else
            $db->makeSqlQuery($this->application,$this->site); 
    }
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;");
       if ($this->isSuperAdministrator())
           $db->makeSqlQuerySuperAdmin($this->application); 
       else
           $db->makeSqlQuery($this->application,$this->site);        
    }
    
    protected function executeDeleteQuery($db)
    {         
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;");
         if ($this->isSuperAdministrator())
            $db->makeSqlQuerySuperAdmin($this->application); 
         else
            $db->makeSqlQuery($this->application,$this->site);        
    }
    
    protected function executeIsExistQuery($db)    
    {
      $parameters=array($this->email,$this->username);  
      if ($this->id)
      {
        $parameters[]=$this->id;
        $query="SELECT id FROM ".self::getTable()." WHERE (email='%s' OR username='%s') AND id!=%d AND application@@IN_APPLICATION@@;"; 
      } 
      else
      {        
        $query="SELECT id FROM ".self::getTable()." WHERE (email='%s' OR username='%s') AND application@@IN_APPLICATION@@;";
      }   
       $db->setParameters($parameters)
          ->setQuery($query);
        if ($this->isSuperAdministrator())
            $db->makeSqlQuerySuperAdmin($this->application); 
         else
            $db->makeSqlQuery($this->application,$this->site); 
         // ->makeSqlQuery($this->application,$this->site);     
    }
    
    function getUpperCaseLastName()
    {
        return strtoupper($this->get('lastname'));
    }
    
     function getUpperCaseFirstName()
    {
        return strtoupper($this->get('firstname'));
    }
    // Permission is UserPermission or GroupPermission
    function addPermission($permission)
    {
       $this->permissions[]=$permission;
    }
    
    
       
    function addGroup(Group $group)
    {
        $this->groups[$group->get('id')]=$group;
        return $this;
    }
    
    function hasGroup(Group $group)
    {
        return isset($this->groups[$group->get('id')]);
    }
     
    function getAllPermissionNames()
    {
        if (!$this->permission_names)
        {
           foreach ($this->permissions as $group_or_user_permission)
           {
               $this->permission_names[]=$group_or_user_permission->getPermission()->getName();              
           }    
        }          
        return $this->permission_names;       
    } 
      
    
    // SETTERS
    function setLastLogin($time)
    {
        $this->set('lastlogin',$time);
    } 
    
    // GETTER    
    
    /*
    function getLastName($ucfirst=false)
    {
        if ($ucfirst)
            return ucfirst($this->lastname);
        return $this->lastname;
    }
    
    function getFirstName($ucfirst=false)
    {
        if ($ucfirst)
            return ucfirst($this->lastname);
        return $this->firstname;
    }*/
    
  /*  function getEmail()
    {
        return $this->email;
    }
    
    function getPassword()
    {
        return $this->password;
    }   */   
    
    function emailToSend()
    {
       $this->set('email_tosend','YES');
       return $this;
    }
    
    function emailSent()
    {
       $this->set('email_tosend','NO');
       return $this;
    }
    
    function getGender()
    {
        return $this->get('sex');
    }
    
    // FOR DISPLAY
    public function __toString()
    {      
       return (string) $this->firstname.' '.$this->lastname;
    }
    
    protected function _getName($reverse=true)
    {
        if ($reverse)
            return (string) $this->firstname.' '.$this->lastname;
        return (string) $this->lastname.' '.$this->firstname;
    }        
    
    public function getName($reverse=true,$ucfirst=true)
    {
       if ($ucfirst)
       {    
           if ($reverse)
            return ucfirst($this->firstname)." ".ucfirst($this->lastname);
           else 
            return ucfirst($this->lastname)." ".ucfirst($this->firstname);
       }
        return $this->_getName($reverse);  
    }         

    // User directory data
    public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/".$this->getApplication()."/data/users/".$this->get('id');
    }
    
    function encryptPassword()
    {     
        if (($this->hasPropertyChanged('password') || $this->isNotLoaded())&& $this->get('password') )
        {         
            $this->set('password',md5($this->get('password')));
            $this->set('last_password_gen',date("Y-m-d H:i:s"));
        }    
        return $this;
    }
    
    function set($name,$value)
    {
        if ($name=='password' && $value=='')
            return $this;
        return parent::set($name, $value);
    }  
    
    public function isSuperAdministrator()
    {
        return ($this->get('application')=='superadmin');
    }
    
 /*   public function getFunctions()
    {
        if ($this->isNotLoaded())
            return array();
        $functions=array();
        $db=mfSiteDatabase::getInstance()
                 ->setParameters(array('user_id'=>$this->get('id')))
                 ->setQuery("SELECT * FROM ".UserFunctions::getTable()." WHERE user_id={user_id};")
                 ->makeSqlQuery($this->application,$this->site);
         if (!$db->getNumRows())
            return $functions;       
        while ($item=$db->fetchObject('UserFunction'))
        {
           $item->loaded();
           $item->site=$this->getSite();
           $functions[]=$item;
        }
        return $functions;
    }*/
    
    public function getFunctionsId()
    {
        if ($this->isNotLoaded())
            return array();        
        $functions=array();
        $db=mfSiteDatabase::getInstance()
                 ->setParameters(array('user_id'=>$this->get('id')))
                 ->setQuery("SELECT function_id FROM ".UserFunctions::getTable()." WHERE user_id={user_id};")
                 ->makeSqlQuery($this->application,$this->site);
         if (!$db->getNumRows())
            return $functions;       
        while ($row=$db->fetchArray())
        {                     
           $functions[]=$row['function_id'];
        }     
        return $functions;
    }
    
    public function updateFunctions($functions)
    {      
        if ($this->isNotLoaded())
            return array();
        $db=mfSiteDatabase::getInstance();
        if (empty($functions))
        {
            $db->setParameters(array('user_id'=>$this->get('id')))
                 ->setQuery("DELETE FROM ".UserFunctions::getTable()." WHERE user_id={user_id};")
                 ->makeSqlQuery();
            return ;
        }    
        
        if ($functions)
        {    
            // Remove not used functions
            $db->setParameters(array('user_id'=>$this->get('id')))
                     ->setQuery("DELETE FROM ".UserFunctions::getTable()." WHERE user_id={user_id} AND function_id NOT IN(".implode(",",$functions).");")
                     ->makeSqlQuery();
        }         
        // get existing 
        $db->setParameters(array('user_id'=>$this->get('id')))
                 ->setQuery("SELECT * FROM ".UserFunctions::getTable()." WHERE user_id={user_id};")
                 ->makeSqlQuery();
        $collection=new UserFunctionsCollection(null,$this->getSite());        
        if ($db->getNumRows())
        {      
            while ($item=$db->fetchObject('UserFunctions'))
            {                      
               $collection[]=$item->loaded();            
               if (($key=array_search($item->get('function_id'),$functions))!==false)
               {                 
                  unset($functions[$key]);               
               }   
            }     
        }                
        // Add new user functions        
        foreach ($functions as $id)
        {
            $item= new UserFunctions(null,$this->getSite());
            $item->add(array('user_id'=>$this,'function_id'=>$id));
            $collection[]=$item;
        }    
        $collection->save();
    } 
    
    public function updateGroups($groups)
    {
        //var_dump($functions);        
        if ($this->isNotLoaded())
            return array();
        $db=mfSiteDatabase::getInstance();
        if (empty($groups))
        {
            $db->setParameters(array('user_id'=>$this->get('id')))
                 ->setQuery("DELETE FROM ".UserGroup::getTable()." WHERE user_id={user_id};")
                 ->makeSqlQuery();
            return ;
        }    
        if ($groups)
        {    
            // Remove not used groups
            $db->setParameters(array('user_id'=>$this->get('id')))
                     ->setQuery("DELETE FROM ".UserGroup::getTable()." WHERE user_id={user_id} AND group_id NOT IN(".implode(",",$groups).");")
                     ->makeSqlQuery();
        }
        // get existing 
        $db->setParameters(array('user_id'=>$this->get('id')))
                 ->setQuery("SELECT * FROM " . UserGroup::getTable() . " WHERE user_id={user_id};")
                 ->makeSqlQuery();
        $collection=new UserGroupCollection(null, $this->getSite());
        if ($db->getNumRows())
        {
            while ($item=$db->fetchObject('UserGroup'))
            {                                   
               $collection[]=$item->loaded();
               if (($key=array_search($item->get('group_id'),$groups))!==false)
                  unset($groups[$key]);               
            }     
        }         
        // Add new user groups        
        foreach ($groups as $id)
        {
            $item= new UserGroup(null,'admin',$this->getSite());
            $item->add(array('user_id'=>$this,'group_id'=>$id,'is_active'=>'YES'));
            $collection[]=$item;
        }    
        $collection->save();
    } 
    
    function getTeamUsers()
    {
        if (!$this->teams_users)
        {    
            $db=mfSiteDatabase::getInstance()           
                ->setParameters(array('user_id'=>$this->get('id')))
                ->setQuery("SELECT ".User::getFieldsAndKeyWithTable()." FROM ".User::getTable().
                           " LEFT JOIN ".UserTeamUsers::getInnerForJoin('user_id').
                           " LEFT JOIN ".UserTeamUsers::getOuterForJoin('team_id').
                           " WHERE ".UserTeam::getTableField('manager_id')."={user_id} OR ".    
                                    UserTeam::getTableField('manager2_id')."={user_id}".
                           ";")               
                ->makeSqlQuery();  
            if (!$db->getNumRows())
                return array();
            $this->teams_users=array();
            while ($item=$db->fetchObject('User'))
            {               
               $item->site=$this->getSite();
               $this->teams_users[$item->get('id')]=$item->loaded();
            }            
        }
        return $this->teams_users;
    }
    
    function getTeams()
    {
        if (!$this->teams)
        {    
            $db=mfSiteDatabase::getInstance()           
                ->setParameters(array('user_id'=>$this->get('id')))
                ->setQuery("SELECT ".UserTeam::getFieldsAndKeyWithTable()." FROM ".UserTeam::getTable().
                           " LEFT JOIN ".UserTeamUsers::getInnerForJoin('team_id').
                           " WHERE ".UserTeamUsers::getTableField('user_id')."={user_id}".                      
                           ";")               
                ->makeSqlQuery();  
            if (!$db->getNumRows())
                return array();
            $this->teams=array();
            while ($item=$db->fetchObject('UserTeam'))
            {               
               $item->site=$this->getSite();
               $this->teams[$item->get('id')]=$item->loaded();
            }            
        }
        return $this->teams;
    }
     
    function getManagerTeam()
    {
        if (!$this->team)
        {    
            $db=mfSiteDatabase::getInstance()           
                ->setParameters(array('manager_id'=>$this->get('id')))
                ->setQuery("SELECT ".UserTeam::getFieldsAndKeyWithTable()." FROM ".UserTeam::getTable().                         
                           " WHERE ".UserTeam::getTableField('manager_id')."={manager_id}".                      
                           ";")               
                ->makeSqlQuery();  
            if (!$db->getNumRows())
                return null;
            $this->team=$db->fetchObject('UserTeam');                        
            $this->team->site=$this->getSite();
            $this->team->loaded();                        
        }
        return $this->team;
    }
    
    function getFunctions()
    {
        if (!$this->functions)
        {    
            $db=mfSiteDatabase::getInstance()           
                ->setParameters(array('user_id'=>$this->get('id')))
                ->setQuery("SELECT ".UserFunction::getFieldsAndKeyWithTable()." FROM ".UserFunction::getTable().
                           " LEFT JOIN ".UserFunctions::getInnerForJoin('function_id').
                           " WHERE ".UserFunctions::getTableField('user_id')."={user_id}".                      
                           ";")               
                ->makeSqlQuery();  
            if (!$db->getNumRows())
                return array();
            $this->functions=array();
            while ($item=$db->fetchObject('UserFunction'))
            {               
               $item->site=$this->getSite();
               $this->functions[$item->get('id')]=$item->loaded();
            }            
        }
        return $this->functions;
    }
    
    function getFunctionsI18n($lang=null)
    {
        if (!$this->functions_i18n)
        {    
            if ($lang==null)
                $lang=mfContext::getInstance()->getUser()->getCountry();
            $db=mfSiteDatabase::getInstance()           
                ->setParameters(array('user_id'=>$this->get('id'),'lang'=>$lang))
                ->setQuery("SELECT ".UserFunctionI18n::getFieldsAndKeyWithTable()." FROM ".UserFunction::getTable().
                           " LEFT JOIN ".UserFunctions::getInnerForJoin('function_id').
                           " LEFT JOIN ".UserFunctionI18n::getInnerForJoin('function_id')." AND lang='{lang}'".
                           " WHERE ".UserFunctions::getTableField('user_id')."={user_id}".                      
                           ";")               
                ->makeSqlQuery();  
            if (!$db->getNumRows())
                return array();
            $this->functions_i18n=array();
            while ($item=$db->fetchObject('UserFunctionI18n'))
            {               
               $item->site=$this->getSite();
               $this->functions_i18n[$item->get('id')]=$item->loaded();
            }            
        }
        return $this->functions_i18n;
    }
   
    function getFormattedFunctionsI18n($separator=',')
    {
        $this->getFunctionsI18n();
        $functions=array();
        foreach ($this->functions_i18n as $function)
            $functions[]=$function->get('value');
        return implode($separator,$functions);
    }
    
    function getGroups()
    {
        if (!$this->groups)
        {    
            $db=mfSiteDatabase::getInstance()           
                ->setParameters(array('user_id'=>$this->get('id')))
                ->setQuery("SELECT ".Group::getFieldsAndKeyWithTable()." FROM ".Group::getTable().
                           " LEFT JOIN ".UserGroup::getInnerForJoin('group_id').
                           " LEFT JOIN ".UserGroup::getOuterForJoin('user_id').
                           " WHERE ".UserGroup::getTableField('user_id')."={user_id}".                      
                           ";")               
                ->makeSqlQuery();  
            if (!$db->getNumRows())
                return array();
            $this->groups=array();
            while ($item=$db->fetchObject('Group'))
            {               
               $item->site=$this->getSite();
               $this->groups[$item->get('id')]=$item->loaded();
            }            
        }
        return $this->groups;
    }
    
    function getSerializedI18nGroups()
    {
        $groups=array();
        foreach (explode(',',$this->groups) as $group)
           $groups[]=__($group,array(),'groups');
        return implode(",",$groups);
    }
    
    function getGroupNames()
    {
        if (!$this->groups_names)
        {    
            $this->groups_names=array();
            foreach ($this->getGroups() as $group)
            {
                $this->groups_names[$group->get('id')]=$group->get('name');
            }
        }
        return $this->groups_names;
    }
    
    function hasGroups($groups)
    {
        $user_groups=$this->getGroupNames();
        foreach ((array)$groups as $group)
        {
            if (in_array($group,$user_groups))
                 return true;   
        }    
        return false;
    }
    
    function getFunctionNames()
    {
        if (!$this->functions_name)
        {    
            $this->functions_names=array();
            foreach ($this->getFunctions() as $function)
            {
                $this->functions_names[$function->get('id')]=$function->get('name');
            }
        }
        return $this->functions_names;
    }
    
    function hasFunctions($functions)
    {
        $user_functions=$this->getFunctionNames();
        foreach ((array)$functions as $function)
        {
            if (in_array($function,$user_functions))
                 return true;   
        }    
        return false;
    }
        
    function toArray($fields=array())
    {
        $values=  parent::toArray($fields);    
        if (empty($fields) || in_array('name',$fields))
            $values['name']=ucwords((string)$this);
        if (empty($fields) || in_array('courtesy',$fields))
            $values['courtesy']=format_courtesy('Dear',$this->getGender());
        if (empty($fields) || in_array('gender',$fields))
            $values['gender']=format_gender($this->getGender(),1,true,true);        
        return $values;
    }
    
   function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new UserFormatter($this):$this->formatter;
   }
   
   function hasLastLogin()
   {
       return (boolean)$this->get('lastlogin');
   }
   
    function hasContentGroup()
    {
        return (boolean)$this->get('content_group_id');
    }
   
   function getContentGroup()
    {
        return $this->_content_group_id=$this->_content_group_id===null?new ContentGroup($this->get('content_group_id')):$this->_content_group_id;
    }
    
      function hasSpeciality()
    {
        return (boolean)$this->get('specialty_id');
    }
    
      function getSpeciality()
    {
       return $this->_specialty_id=$this->_specialty_id===null?new UserSpeciality($this->get('specialty_id')):$this->_specialty_id;
    }
    
    
    function hasProfession()
    {
        return (boolean)$this->get('profession_id');
    }
    
    
       function getProfession()
    {
       return $this->_profession_id=$this->_profession_id===null?new UserProfession($this->get('profession_id')):$this->_profession_id;
    }    
    
     function getSettings()
    {
        return $this->settings=$this->settings===null?new UserSettings():$this->settings;
    }
    
    function create(mfArray $values)
    {       
        $this->add($values);
        $this->save();
        return $this;
    }
    
    
    function getAvatar()
    {
        return $this->avatar=$this->avatar===null?new UserPictures():$this->avatar;
    }
    
    
    function uploadAvatarFromUrl($url)
    {
        /*
         * 
         * 
         * 
         * 
         * 
         * 
         */
        
        
        return $this;
    }
    
}
