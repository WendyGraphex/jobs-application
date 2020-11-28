<?php

class site_languages_listActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {   
        $this->languages=languageUtils::getLanguages(); 
        $this->language_active=$request->getLanguage();    
        $this->referer=$request->getParameter('route_i18n',$request->getParameter('route'));            
        $this->uri=$request->getURI();   
        $this->get_parameters=$request->getGetParametersForURL();        
    } 
    
    
}