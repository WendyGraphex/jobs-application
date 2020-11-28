<?php

class site_event_menuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
       $this->menu= MenuManager::getInstance('site_event.user.dashboard')->getMenu();     
       $this->user=$this->getUser();
       $this->url_selected=$request->getURI();  
    // echo "<pre>"; var_dump($this->menu); echo "</pre>";
    } 
    
    
}