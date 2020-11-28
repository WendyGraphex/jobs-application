<?php

class site_languages_dialogListLanguagesAdminActionComponent extends mfActionComponent {

    function execute(mfWebRequest $request)
    {          
        $this->languages=LanguageUtilsAdmin::getI18nLanguagesAdmin();              
        $this->selected=(string)$this->getParameter('selected',$this->getUser()->getLanguage());
    } 
    
    
}


