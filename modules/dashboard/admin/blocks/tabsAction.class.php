<?php

class dashboard_tabsActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                    
      $this->tabs=TabsManager::getInstance('dashboard.site'); 
      $this->user=$this->getUser();
    } 
    
    
}