<?php

class EmployeeSkillExportCsvFilter extends ExportCsvFilterBase {
    
    const UPPERCASE=1,TRIM=2;
    
    protected $filter=null,$user=null;
    
    function __construct(EmployeeSkillFormFilter $filter,$user,$options=array()) 
    {              
       parent::__construct(array_merge($options,array('charset_from'=>'UTF-8','charset_to'=>'ISO-8859-15')));
       $this->filter=$filter;        
       $this->user=$user;
       $this->setOption('lang',$this->getUser()->getLanguage());
       $this->execute();
    }        
    
    function getUser()
    {
        return $this->user;
    }
    
    static function getDirectory()
    {               
        return mfConfig::get('mf_site_app_cache_dir')."/data/employees/skills/exports";        
    }
    
     
    function getHeader()
    {
        return array(
                    __("ID"),                   
                    __("NAME"),                    
                    __("PICTURE"),     
                    __("ICON"),   
                    __("LANGUAGE"),   
                    __("TITLE"),
                    __("DESCRIPTION"),
                    __("KEYWORD"),
                    __("CONTENT"),
                    __("CREATION")
                    );
    }
    
    function getFilter()
    {
        return $this->filter;
    }
    
    function outputLine($data)
    {     
        $values=array();
        foreach ($data as $field)
           $values[]=$this->formatField($field);                
        $this->writeLine(implode(";",$values)."\n");       
    }
    
    protected function encode($str,$encode=0)
    {       
       if ($encode | self::UPPERCASE)
          $str= mb_strtoupper($str,$this->getOption('charset_from','UTF-8'));
       if ($encode | self::TRIM)
          $str= trim($str);
       if ($this->getOption('charset_to')=='ISO-8859-15')
            $str = str_replace("€", "[128]", $str); // Signe
       $str=mb_convert_encoding( $str ,$this->getOption('charset_to','UTF-8'),$this->getOption('charset_from','UTF-8'));
       if ($this->getOption('charset_to')=='ISO-8859-15')
            $str = str_replace("[128]",chr(128), $str);
       return $str;       
    }        
    
    protected function getItemsFromDatabase($db)
    {                         
        if (!$db->getNumRows())            
            return ;              
        while ($items=$db->fetchObjects())
        {                                                                   
           $this->outputLine(array(
               $items->getEmployeeSkill()->get('id'),
               $this->encode($items->getEmployeeSkill()->get('name')),    
               $this->encode($items->getEmployeeSkill()->get('picture')),    
               $this->encode($items->getEmployeeSkill()->get('icon')),    
               $this->encode($items->hasEmployeeSkillI18n()?$items->getEmployeeSkillI18n()->get('lang'):__("----")),    
               $this->encode($items->hasEmployeeSkillI18n()?$items->getEmployeeSkillI18n()->get('title'):__("----")),    
               $this->encode($items->hasEmployeeSkillI18n()?$items->getEmployeeSkillI18n()->get('meta_description'):__("----")),   
               $this->encode($items->hasEmployeeSkillI18n()?$items->getEmployeeSkillI18n()->get('meta_keyword'):__("----")),   
               $this->encode($items->hasEmployeeSkillI18n()?$items->getEmployeeSkillI18n()->get('content'):__("----")),   
               $this->encode((string)$items->getEmployeeSkill()->getFormatter()->getCreatedAt()->getText()),
           ));
           //'meta_description','meta_keyword','content'
          
        }        
    }
         
    function execute()
    {                      
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('lang'=>$this->getFilter()->getLanguage(),                                                                        
                                      'user_id'=>$this->getUser()->getGuardUser()->get('id')))
                ->setObjects(array('EmployeeSkill','EmployeeSkillI18n'))              
                ->setQuery("SELECT {fields} ".
                           " FROM ".EmployeeSkill::getTable().   
                           " LEFT JOIN ".EmployeeSkillI18n::getInnerForJoin('skill_id')." AND lang='{lang}'".
                           ($this->getFilter()->hasWhere()?" WHERE ".$this->getFilter()->getWhere():"").
                           ";")               
                ->makeSqlQuery(); 
      //  echo $db->getQuery(); die(__METHOD__);
        $this->number_of_items=$db->getNumRows();
        $this->open();
        $this->outputLine($this->getHeader());
        $this->getItemsFromDatabase($db);    
        $this->close();
    }
    
    function getName()
    {
         return __("skills")."-".date("Y-m-d")."-".md5(session_id()).".csv";
    }
}

