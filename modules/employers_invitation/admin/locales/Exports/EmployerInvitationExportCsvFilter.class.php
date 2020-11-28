<?php

class EmployerInvitationExportCsvFilter extends ExportCsvFilterBase {
    
    const UPPERCASE=1,TRIM=2;
    
    protected $filter=null,$user=null;
    
    function __construct(EmployerInvitationFormFilter $filter,$user,$options=array()) 
    {              
       parent::__construct(array_merge($options,array('charset_from'=>'UTF-8','charset_to'=>'ISO-8859-15')),$site);
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
        return mfConfig::get('mf_site_app_cache_dir')."/data/employers/registrations/exports";        
    }
    
     
    function getHeader()
    {
        return array(
                    __("ID"),                   
                    __("FIRSTNAME/LASTNAME"),                    
                    __("EMAIL"),
                    __("PHONE"),
                    __("POSTCODE"),
                    __("CITY"),
                    __("STATE"),
                    __("COUNTRY"),
                    __("HAS EXPERIENCE"),
                    __("ATTENDING"),
                    __("OTHER ATTENDING"),
                    __("LEVEL"),
                    __("OTHER LEVEL"),
                    __("PROFESSION"),
                    __("RACE"),
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
               $items->getEmployerInvitation()->get('id'),
               $this->encode($items->getEmployerInvitation()->get('firstname'))." ".$this->encode($items->getEmployerInvitation()->get('lastname')),    
               $this->encode($items->getEmployerInvitation()->get('email')),
               $this->encode($items->getEmployerInvitation()->get('phone')),
               $this->encode($items->getEmployerInvitation()->get('poscode')),
               $this->encode($items->getEmployerInvitation()->get('city')),           
               $this->encode($items->getEmployerInvitation()->get('state')),      
               $this->encode($items->getEmployerInvitation()->getFormatter()->getCountry()),
               $this->encode(__($items->getEmployerInvitation()->get('has_experience'))),  
               $this->encode($items->getEmployerInvitation()->get('attending')),   
               $this->encode($items->getEmployerInvitation()->get('other_attending')),   
               $this->encode($items->getEmployerInvitation()->get('level')),   
               $this->encode($items->getEmployerInvitation()->get('other_level')),   
               $this->encode($items->getEmployerInvitation()->get('profession')),   
               $this->encode($items->getEmployerInvitation()->get('race')),   
               $this->encode((string)$items->getEmployerInvitation()->getFormatter()->getCreatedAt()->getText()),
           ));
           
          
        }        
    }
         
    function execute()
    {                      
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('lang'=>$this->getOption('lang'),'user_id'=>$this->getUser()->getGuardUser()->get('id')))
                ->setObjects(array('EmployerInvitation'))              
                ->setQuery("SELECT {fields} ".
                           " FROM ".EmployerInvitation::getTable().                          
                           ($this->getFilter()->hasWhere()?" WHERE ".$this->getFilter()->getWhere():"").
                           " ORDER BY created_at ASC".
                           ";")               
                ->makeSqlQuery(); 
        $this->number_of_items=$db->getNumRows();
        $this->open();
        $this->outputLine($this->getHeader());
        $this->getItemsFromDatabase($db);    
        $this->close();
    }
    
    function getName()
    {
         return __("employers")."-".__("contacts")."-".date("Y-m-d")."-".md5(session_id()).".csv";
    }
}

