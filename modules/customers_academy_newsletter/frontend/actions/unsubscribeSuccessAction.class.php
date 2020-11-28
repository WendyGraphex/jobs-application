<?php

class customers_academy_newsletter_unsubscribeSuccessAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {  
         $this->newsletter=$request->getRequestParameter('newsletter');
    }

}
