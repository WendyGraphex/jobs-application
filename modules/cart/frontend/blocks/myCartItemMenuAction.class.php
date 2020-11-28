<?php

class cart_myCartItemMenuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())        
            return mfView::NONE;       
    } 
    
    
}
