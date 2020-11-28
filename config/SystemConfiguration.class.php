<?php

define("SYSTEM_VERSION", "1.0.0");
require_once dirname(__FILE__)."/../core/internal/Autoload/mfAutoload.class.php";
mfAutoload::getInstance()->register(); // Setup du core (common)

class SystemConfiguration {
       
       static function getApplicationConfiguration($application)
       {
         // Check if config exits
         if (!file_exists(dirname(__FILE__) . "/../config/config.php")) {
            echo ("Please install System with this link (config file missing): <a href='http://" . $_SERVER['HTTP_HOST'] . "/install/index.php'>http://" . $_SERVER['HTTP_HOST'] . "/install/index.php</a> ");
            die();
        }                   
        $config=include_once dirname(__FILE__) . "/../config/config.php";
       // Test if system is well installed
        if ((!isset($config['congratulation'])) ||($config['congratulation']!= "ok")) {
           $content="Install not completed. Please re-install System with this link : <a href='http://".$_SERVER['HTTP_HOST']."/install/index.php'>http://".$_SERVER['HTTP_HOST']."/install/index.php</a> ";
           echo $content;
           die();
        } 
        $environnement=isset($_SERVER["SYSTEM_ENV"])?$_SERVER["SYSTEM_ENV"]:'prod';       
        $debug=(isset($_SERVER["SYSTEM_DEBUG"])&&$_SERVER["SYSTEM_DEBUG"]=='true')?true:false;
        mfConfig::set('superadmin',$config['superadmin']);
        $class = $application.'Configuration';
        $file=realpath(dirname(__FILE__)."/../apps/".$application."/config/".$class.".class.php"); 
        require_once $file;
        return new $class($environnement,$debug);
       }         
}
