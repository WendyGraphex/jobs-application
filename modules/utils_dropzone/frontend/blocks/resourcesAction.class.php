<?php


class utils_dropzone_resourcesActionComponent extends mfActionComponent {
    
    function preExecute() {
        $this->addJavascript('dropzone/'.$this->getParameter('version','4.1.0')."/dropzone.min.js");        
    }
    
    function execute(mfWebRequest $request) 
    {                          
        $this->version=$this->getParameter('version','4.1.0');
    }     
                    
}    