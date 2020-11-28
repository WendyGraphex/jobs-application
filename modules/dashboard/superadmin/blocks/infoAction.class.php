<?php

class dashboard_infoActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                
        $this->ip= mfWebServer::getInstance()->getIP(); //mfConfig::getSuperAdmin('ip');
        $this->project=mfConfig::getSuperAdmin('project');
    } 
    
    
}