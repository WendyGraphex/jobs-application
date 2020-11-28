<?php

class employers_myUsersItemMenuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();
       if (!$this->getUser()->getGuardUser()->isAdmin())
            return mfView::NONE;       
    } 
    
    
}
