<?php

class CustomerBlogActivityExportCsvFilter extends ExportCsvFilterBase {
    
    const UPPERCASE=1,TRIM=2;
    
    protected $filter=null,$user=null;
    
    function __construct(CustomerBlogActivityFormFilter $filter,$user,$options=array()) 
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
        return mfConfig::get('mf_site_app_cache_dir')."/data/customers/blog/activities/exports";        
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
                    __("PICTURE"),                   
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
               $items->getCustomerBlogActivity()->get('id'),
               $this->encode($items->getCustomerBlogActivity()->get('name')),    
               $this->encode($items->getCustomerBlogActivity()->get('picture')),    
               $this->encode($items->getCustomerBlogActivity()->get('icon')),    
               $this->encode($items->hasCustomerBlogActivityI18n()?$items->getCustomerBlogActivityI18n()->get('lang'):__("----")),    
               $this->encode($items->hasCustomerBlogActivityI18n()?$items->getCustomerBlogActivityI18n()->get('meta_title'):__("----")),                 
               $this->encode((string)$items->getCustomerBlogActivity()->getFormatter()->getCreatedAt()->getText()),
           ));
           
          
        }        
    }
         
    function execute()
    {                      
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('lang'=>$this->getOption('lang'),
                                      'lb'=>$this->getFilter()->getNode()->get('lb'),
                                      'rb'=>$this->getFilter()->getNode()->get('rb'),
                                      'levelplusone'=>$this->getFilter()->getNode()->get('level')+1,
                                      'user_id'=>$this->getUser()->getGuardUser()->get('id')))
                ->setObjects(array('CustomerBlogActivity','CustomerBlogActivityI18n'))              
                ->setQuery("SELECT {fields} ".
                           " FROM ".CustomerBlogActivity::getTable().   
                           " LEFT JOIN ".CustomerBlogActivityI18n::getInnerForJoin('activity_id')." AND lang='{lang}'".
                           " WHERE lb >= {lb} AND rb <= {rb} ".                                       
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
         return __("activities")."-".date("Y-m-d")."-".md5(session_id()).".csv";
    }
}

