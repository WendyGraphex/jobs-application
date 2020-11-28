<?php


class utils_nodejs_resourcesActionComponent extends mfActionComponent {
     
   
    
    function execute(mfWebRequest $request) 
    {                          
        $this->ip=mfWebServer::getInstance()->getIP();
    }    
                    
}    