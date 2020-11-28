<?php

class dashboard_notificationsManagerActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
      if (!$this->getUser()->isAuthenticated())
          return mfView::NONE;
      $this->notifications=TabsManager::getInstance('dashboard.notifications');     
      $this->user=$this->getUser();
    } 
    
    
}