<?php

class employers_logoutActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                
        if (!$this->getUser()->isAuthenticated())
            return mfView::NONE;  
        if (!$this->getUser()->isEmployerUser())
            return ;
    } 
    
    
}
