<?php


class utils_ckeditor_resourcesActionComponent extends mfActionComponent {
     
   
    function preExecute() {
        $this->addJavascript($this->getParameter('version','4.1.0')."/ckeditor.js",array('module'=>'utils_ckeditor'));        
        $this->addJavascript($this->getParameter('version','4.1.0')."/adapters/jquery.js",array('module'=>'utils_ckeditor'));        
    }
    
    function execute(mfWebRequest $request) 
    {                          
        $this->version=$this->getParameter('version','4.14.1');
        $this->language=$this->getUser()->getLanguage();
        $this->base_url=url("/");
    }    
                    
}    