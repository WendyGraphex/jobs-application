<?php

class employees_myCompanyItemMenuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
      
       $this->user=$this->getUser();      
       if (!$this->getUser()->getGuardUser()->isAdmin() || $this->getUser()->getGuardUser()->isPrivate())
            return mfView::NONE;
    } 
    
    
}
