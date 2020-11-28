<?php

class site_elfinder_FileManagerAction extends mfAction {
    
   
    function preExecute()
    {      
       $this->getResponse()->addJavascript('i18n/elfinder.'.$this->getUser()->getCulture().'.js',array("module"=>"elfinder"));
    }
    
    function execute(mfWebRequest $request) {            
        $this->culture=$this->getUser()->getCulture();
    }
}

