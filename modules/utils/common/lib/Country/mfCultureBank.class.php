<?php

class mfCultureBank {
    
protected $data=array();

  function __construct($culture=null)
  {
        $this->loadCultureBank($culture);
  }
    
  public static function getInstance($culture = 'en')
  {
    static $instances = array();    
    $culture=strtolower($culture);
    if (!isset($instances[$culture]))
    {
      $instances[$culture] = new mfCultureBank($culture);
    }
    return $instances[$culture];
  }
  
  function loadCultureBank($culture=null)
    {
        if ($culture==null) 
            return ; 
       $filename=dirname(__FILE__)."/data/iban/".$culture.".php";
       if (is_readable($filename)) 
         $this->data=  include_once $filename;
       else
          throw new mfException(sprintf('Culture bank data file for "%s" was not found.', $culture));
       $this->culture=$culture;       
    }
  
  function getInformation($info)
  {
      return isset($this->data[$info])?$this->data[$info]:null;
  }
  
  function getCountrySupported()
  {
      $countries=array();
      foreach (glob(dirname(__FILE__)."/data/iban/*.php") as $file)
          $countries[]=basename($file,".php");
      return $countries;
  }
    
}