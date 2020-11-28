<?php

abstract class ServerCronManagerEngineCore {
    
    protected $errors=null,$options=null;
    
    abstract  function process();
       
    abstract function cron();
    
    function __construct($options=array()) {     
        $this->errors=new mfArray();
        $this->options=$options;       
    }
    
     
    function getOption($name,$default=null)
    {
        return isset($this->options[$name])?$this->options[$name]:$default;
    }
         
    function setOption($name,$value)
    {
        $this->options[$name]=$value;
        return $this;
    }
      
    
}
