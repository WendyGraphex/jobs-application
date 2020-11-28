<?php

class mfConfigCacheSite extends mfConfigCache {
    
     protected $site=null;
    
     function callHandler($handler, $configs, $cache,$parameters,$site) {
            
        $handlers=  mfcontext::getInstance()->getConfigCache()->getHandlers();                
        // handler instance to call for this configuration file
        $handlerInstance = null;
        $basename = basename($handler);
        if (isset($handlers[$handler])) 
        {                       
            $handlerInstance = $handlers[$handler];
        } 
        else 
        {
            foreach (array_keys($handlers) as $key) {
                // replace wildcard chars in the configuration
                $pattern = strtr($key, array('*' => '(.*?)'));
                $matches = array();
                // create pattern from config
                if ($key != $pattern) {
                    if (preg_match('#' . $pattern . '$#', $handler, $matches)) {
                       // echo "FOUND CONFIG CACHE Pattern=".$pattern." Matches=".print_r($matches,true)."<br/>";
                        $handlerInstance = $this->getHandler($key);
                        array_shift($matches);
                        $handlerInstance->getParameters()->set('wildcardValues', $matches);
                        break;
                    }
                }
            }
            
        }        
        if (!$handlerInstance) {
            throw new mfException("Error handler($handler) doesn't exist");
        }
        // call the handler and retrieve the cache data
        $handlerInstance->getParameters()->set('parameters', $parameters); 
       // $data = $handlerInstance->execute($configs);  // ,$parameters);
        $handlerInstance->getParameters()->set('site', $site);  
        $data=$handlerInstance->execute($configs);       
        $this->writeCacheFile($handler, $cache, $data);
    }       
    
    function checkConfig($configPath,$suffix="",$parameters=array(),$site=null) {         
        if ($site && !$site instanceof Site)
            throw new mfException("site is invalid in config cache site.");      
        if ($site)
            $suffix=$site->get('site_host').".".$suffix;              
        $cache = $this->getCacheName($configPath,$suffix);       
        if (!mfConfig::get('mf_debug') && is_readable($cache))
            return $cache;
        $files = $this->configuration->getConfigPaths($configPath);        
        // find the more recent configuration file last modification time       
        $mtime = 0;
        foreach ($files as $file) {
            if (filemtime($file) > $mtime) {
                $mtime = filemtime($file);
            }
        }       
        if (!is_readable($cache) || $mtime > filemtime($cache)) {
            // configuration has changed so we need to reparse it          
            $this->callHandler($configPath, $files, $cache,$parameters,$site); 
        }       
        return $cache;
    }
    
   
    
}

