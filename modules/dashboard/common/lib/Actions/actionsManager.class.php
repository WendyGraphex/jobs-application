<?php


class actionsManager {

    protected static $instances=array();
    protected $actions=null;
    
    static function getInstance($name)
    {
         if (self::$instances[$name])
            return self::$instances[$name];
        else
        {
            self::$instances[$name]=new self($name);
            return self::$instances[$name];
        }    
    } 
    
    function __construct($name) {     
       $context=mfContext::getInstance(); // Used to config tab file
       $request=$context->getRequest();  // Used to config tab file
       require_once $context->getConfigCache()->checkConfig('config/actions.php',$name,$name); 
    }
    
    function getActions()
    {
      return $this->actions;
    }
    
    
    
}

