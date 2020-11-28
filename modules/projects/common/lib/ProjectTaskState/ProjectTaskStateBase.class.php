<?php

class ProjectTaskStateBase extends mfObject3 {
     
    protected static $fields=array('name','icon','color');
    const table="t_project_task_state"; 
    
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
    
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->str_escape($this->get('name')),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSqlQuery();      
    }
    
   
    public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/projects/task/state/admin/".$this->get('id');
    }  
    /* =================================== P I C T U R E =========================================== */
    
    public function getIcon()
    {
      if (!$this->get('_icon'))      
      {    
         $this->_icon=new PictureObject2(array(
                 "path"=>$this->getDirectory(),
                 "picture"=>$this->get('icon'),
                 "urlPath"=>url("/nocache/data/projects/task/state/admin/".$this->get('id')."/","web","frontend"),
                 "url"=>url("/nocache/data/projects/task/state/admin/".$this->get('id')."/".$this->get('icon'),"web","frontend")
              ));
      }
      return $this->_icon;     
    }
    
    public function deleteIcon()
    {
        $this->getIcon()->remove(); 
        $this->set('icon','');
        $this->save();
    }       
    
    function setIconName($filename)
    {
       $this->set('icon',self::getName($filename));
       return $this->get('icon');
    }
    
    static function getName($name)
    {
       return str_replace(" ","-",mfTools::I18N_noaccent($name));
    }     
    
      public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
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
             $this->i18n=new ProjectTaskStateI18n(array('lang'=>$lang,"state_id"=>$this->get('id')),$this->getSite());
         }   
         return $this->i18n;
     } 
      
     
     static function getStatesForI18nSelect()
    {
        $values=new mfArray();      
        $lang=  mfcontext::getInstance()->getUser()->getLanguage();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>$lang))
                ->setQuery("SELECT ".ProjectTaskStateI18n::getFieldsAndKeyWithTable()." FROM ".ProjectTaskStateI18n::getTable().
                           " WHERE lang='{lang}' ORDER BY value ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('ProjectTaskStateI18n'))
        { 
            $values[$item->get('state_id')]=ucfirst($item->get('value'));
        }      
        return $values;
    }
    
     static function getStatesForSelect()
    {
        $values=new mfArray();      
        $lang=  mfcontext::getInstance()->getUser()->getLanguage();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>$lang))
                ->setObjects(array('ProjectTaskState','ProjectTaskStateI18n'))
                ->setQuery("SELECT {fields} FROM ".ProjectTaskState::getTable().
                           " INNER JOIN ".ProjectTaskStateI18n::getInnerForJoin('state_id').
                           " WHERE lang='{lang}' ORDER BY value ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($items=$db->fetchObjects())
        { 
            $item=$items->getProjectTaskState();
            $item->setI18n($items->getProjectTaskStateI18n());
            $values[$item->get('id')]=$item;
        }      
        return $values;
    }
    
   /* function getNumberOfTasks()
    {
        return format_number($this->get('number_of_tasks'),"#");
    }*/
}
