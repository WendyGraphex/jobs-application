<?php


class system_site_ajaxViewInformationAction extends mfAction {
    
        
    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();                      
        
        $this->system_site=new SystemSite();
    }
    
}

