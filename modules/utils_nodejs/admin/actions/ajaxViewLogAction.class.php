<?php


class utils_nodejs_ajaxViewLogAction extends mfAction {
    
       function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();                     
         $this->settings= new UtilsNodeJsSettings();          
    }
    
}

