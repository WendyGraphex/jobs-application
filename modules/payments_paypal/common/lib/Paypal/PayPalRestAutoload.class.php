<?php

class PayPalRestAutoload {
    
    private static $loader;
    
    private $classes = array(),$missings=array();
     
    static function register()
    { 
         if (null !== self::$loader) {
            return self::$loader;
        }
        self::$loader=new PayPalRestAutoload();
        spl_autoload_register(array(self::$loader, 'loadClass'), true, true);
    }
    
     function loadClass($class)
    {
        if (isset($this->missings[$class])) {
            return false;
        }
        if (isset($this->classes[$class]))
            return true;
        if ($file = $this->findFile($class)) {
            PaypalIncludeFile($file);    
            $this->classes[$class]=true;
            return true;
        }       
        if (false === $file) {
            // Remember that this class does not exist.
            $this->missings[$class] = true;
        }
    }
    
    function findFile($class)
    {
         if (isset($this->classes[$class]))
            return $this->classes[$class];        
          $path = strtr($class, '\\', DIRECTORY_SEPARATOR) . ".php";          
          $dir= __DIR__."/../../Vendors";
          if (file_exists($file = $dir . DIRECTORY_SEPARATOR . $path))   
             return $file;         
         return false;
    }
    
    
}

function PaypalIncludeFile($file)
{
    include $file;
}


