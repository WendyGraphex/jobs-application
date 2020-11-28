<?php

class google_analytics_tagActionComponent extends mfActionComponent {

    function execute(mfWebRequest $request)
    {  
       $this->uri=$this->getParameter('uri',$request->getURI());
       $this->settings= new GoogleAnalyticsSettings();      
    }
    
}