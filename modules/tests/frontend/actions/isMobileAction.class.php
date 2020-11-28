<?php


class tests_isMobileAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
      
        if ($request->getUserAgent()->isMobile())
            echo "Mobile detected";
        else 
            echo "No mobile detected";
        die();
    } 
    
    
}

