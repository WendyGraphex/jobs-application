<?php

class dashboard_menuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
       $this->menu= MenuManager::getInstance('dashboard')->getMenu();     
       $this->user=$this->getUser();
       $this->url_selected=$request->getPartialURI(); 
      // var_dump($this->url_selected);
    } 
    
    
}