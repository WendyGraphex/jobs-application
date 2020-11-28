<?php

class ExportCsvFilterBase {
    
    protected $filename=null,$options=array(),$handler=null,$number_of_items=0;
    
    function __construct($options=array()) 
    {            
        $this->options=$options;
        $this->filename=static::getDirectory()."/".$this->getName();         
    }        
    
    static function getDirectory()
    {              
        return mfConfig::get('mf_site_app_cache_dir')."/data";        
    }
    
    
    function getName()
    {
        return "file.csv";
    }
    
    function build()
    {
        
    }
    
    protected function conv($value)
    {       
       // return mb_convert_encoding($value,$this->getOption('charset_to','UTF-8'),$this->getOption('charset_from','UTF-8'));
        return $value;
    }
    
    protected function formatField($name)
    {
        return '"'.$this->conv($this->escape($name)).'"';
    }
            
    protected function escape($value="")
    {
       return str_replace('"', '""', $value); 
    }
    
    function getOption($name,$default=null)
    {
        return array_key_exists($name, $this->options)?$this->options[$name]:$default;
    }   
    
     function setOption($name,$value)
    {
        return  $this->options[$name]=$value;
    }   
    
    protected function open()
    {        
        mfFileSystem::mkdirs(dirname($this->filename));
        $this->handler=fopen($this->filename,"w+");
    }
    
    protected function close()
    {
       if ($this->handler)
           fclose ($this->handler);
    }
    
    protected function writeLine($line)
    {
        fwrite($this->handler,$line);
    }    
    
    function getFilename()
    {        
        return $this->filename;
    }       
    
    function getNumberOfItems()
    {
        return $this->number_of_items;
    }
}