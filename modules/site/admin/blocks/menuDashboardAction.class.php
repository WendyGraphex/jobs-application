<?php

class site_menuDashboardActionComponent extends mfActionComponent {

   
    function execute(mfWebRequest $request)
    {                    
       $this->menu= MenuManager::getInstance('site.dashboard')->getMenu();
       $this->user=$this->context->getUser();      
    } 
    
    
}