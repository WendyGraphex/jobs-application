<?php

class site_event_cart_myCartItemMenuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();
       if (!$this->getUser()->isEventUser())        
            return mfView::NONE;       
    } 
    
    
}
