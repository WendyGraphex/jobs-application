<?php

class customers_newsletter_unsubscribeSuccessAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {  
         $this->newsletter=$request->getRequestParameter('newsletter');
    }

}
