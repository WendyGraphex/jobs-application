<?php

class CustomerAcademyContactExportCsvFilter extends ExportCsvFilterBase {
    
    const UPPERCASE=1,TRIM=2;
    
    protected $filter=null,$user=null;
    
    function __construct(CustomerAcademyContactFormFilter $filter,$user,$options=array()) 
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
        return mfConfig::get('mf_site_app_cache_dir')."/data/customers/contacts/exports";        
    }
    
    function getHeader()
    {
        return array(
                     __("ID"),                   
                    __("FIRSTNAME"),
                    __("LASTNAME"),
                    __("EMAIL"),
                    __("PHONE"),
                    __("SUBJECT"),
                    __("MESSAGE"),
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
               $items->getCustomerAcademyContact()->get('id'),
               $this->encode($items->getCustomerAcademyContact()->get('firstname')),
               $this->encode($items->getCustomerAcademyContact()->get('lastname')),
               $this->encode($items->getCustomerAcademyContact()->get('email')),
               $this->encode($items->getCustomerAcademyContact()->get('phone')),
               $this->encode($items->getCustomerAcademyContact()->get('subject')),
               $this->encode($items->getCustomerAcademyContact()->get('message')),           
               $this->encode((string)$items->getCustomerAcademyContact()->getFormatter()->getCreatedAt()->getText()),
           ));
           
          
        }        
    }
         
    function execute()
    {                      
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('lang'=>$this->getOption('lang'),'user_id'=>$this->getUser()->getGuardUser()->get('id')))
                ->setObjects(array('CustomerAcademyContact'))              
                ->setQuery("SELECT {fields} ".
                           " FROM ".CustomerAcademyContact::getTable().                          
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
         return __("customers")."-".__("contacts")."-".date("Y-m-d")."-".md5(session_id()).".csv";
    }
}

