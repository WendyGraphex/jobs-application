<?php

class site_elfinder_ajaxFileManagerViewAction extends mfAction {
   
   function preExecute()
    {      
       $this->getResponse()->addJavascript('i18n/elfinder.'.$this->getUser()->getCulture().'.js',array("module"=>"site_elfinder","async"=>false));
    }
    
    function execute(mfWebRequest $request) {         
        $this->culture=$this->getUser()->getCulture();
    }
}

