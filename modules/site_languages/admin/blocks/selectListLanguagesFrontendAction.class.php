<?php


class site_languages_selectListLanguagesFrontendActionComponent extends mfActionComponent{
    
    public function execute(\mfWebRequest $request) {         
        $this->languages=languageUtilsAdmin::getI18nLanguagesFrontend();              
        $this->selected=(string)$this->getParameter('selected',$this->getUser()->getLanguage());
        $this->name=$this->getParameter('id');
    }

}
